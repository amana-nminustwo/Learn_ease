import 'dart:async';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:convert';

class ExpaController extends GetxController {
  final messages = <Map<String, dynamic>>[].obs;
  final isSending = false.obs;
  final isRecording = false.obs;
  final hasTextInput = false.obs;
  late final ScrollController scrollController;

  final AudioRecorder _audioRecorder = AudioRecorder();
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _currentRecordingPath;
  Timer? _recordingTimer;
  final recordingDuration = 0.obs;

  /// Tracks if the user is manually scrolling
  bool userScrolling = false;

  /// Tracks if initial scroll has been performed
  bool _hasPerformedInitialScroll = false;

  @override
  void onInit() {
    super.onInit();
    // Create a new ScrollController instance for this controller
    scrollController = ScrollController();

    // Add scroll listener to detect manual scrolling
    scrollController.addListener(_onScroll);

    _loadMessages();
    _showInitialBotMessage();
  }

  @override
  void onClose() {
    // Properly dispose of listeners and controllers
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    _audioRecorder.dispose();
    _audioPlayer.dispose();
    _recordingTimer?.cancel();
    super.onClose();
  }

  /// Scroll listener to detect manual user interaction
  void _onScroll() {
    if (!scrollController.hasClients) return;

    if (scrollController.position.userScrollDirection != ScrollDirection.idle) {
      userScrolling = true;
    } else {
      // Check if user scrolled back to bottom
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 20) {
        userScrolling = false;
      }
    }
  }

  /// Load saved chat messages from local storage
  Future<void> _loadMessages() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? messagesJson = prefs.getString('expa_messages');

      if (messagesJson != null) {
        final List<dynamic> decoded = jsonDecode(messagesJson);
        messages.value = decoded.map((msg) {
          return {
            'type': msg['type'],
            'text': msg['text'],
            'time': DateTime.parse(msg['time']),
            'isAudio': msg['isAudio'] ?? false,
            'audioPath': msg['audioPath'],
            'audioDuration': msg['audioDuration'],
          };
        }).toList();
      }

      // Jump to the latest message immediately after loading
      if (messages.isNotEmpty) {
        _scrollToBottomInitial();
      }
    } catch (e) {
      print('Error loading messages: $e');
    }
  }

  /// Save messages to SharedPreferences
  Future<void> _saveMessages() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final messagesJson = jsonEncode(
        messages.map((msg) {
          return {
            'type': msg['type'],
            'text': msg['text'],
            'time': (msg['time'] as DateTime).toIso8601String(),
            'isAudio': msg['isAudio'] ?? false,
            'audioPath': msg['audioPath'],
            'audioDuration': msg['audioDuration'],
          };
        }).toList(),
      );
      await prefs.setString('expa_messages', messagesJson);
    } catch (e) {
      print('Error saving messages: $e');
    }
  }

  /// Show welcome message on first load
  void _showInitialBotMessage() async {
    if (messages.isEmpty) {
      await Future.delayed(const Duration(milliseconds: 500));

      final welcomeMessage = {
        'type': 'bot',
        'text': '',
        'time': DateTime.now(),
        'isAnimating': true,
      };

      messages.add(welcomeMessage);
      _scrollToBottom();

      final fullText = 'Hi, how can I help you today?';
      for (int i = 0; i <= fullText.length; i++) {
        await Future.delayed(const Duration(milliseconds: 50));
        welcomeMessage['text'] = fullText.substring(0, i);
        messages.refresh();
        _scrollToBottom();
      }

      welcomeMessage['isAnimating'] = false;
      messages.refresh();
      await _saveMessages();
    }
  }

  /// Send user text message
  void sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    messages.add({
      'type': 'user',
      'text': message,
      'time': DateTime.now(),
      'isAudio': false,
    });

    userScrolling = false;
    await _saveMessages();
    _scrollToBottom();

    // Simulate bot typing
    isSending.value = true;
    await Future.delayed(const Duration(milliseconds: 800));

    final botMessage = {
      'type': 'bot',
      'text': '',
      'time': DateTime.now(),
      'isAnimating': true,
    };

    messages.add(botMessage);
    _scrollToBottom();

    final responseText = _generateBotResponse(message);
    for (int i = 0; i <= responseText.length; i++) {
      await Future.delayed(const Duration(milliseconds: 30));
      botMessage['text'] = responseText.substring(0, i);
      messages.refresh();
      _scrollToBottom();
    }

    botMessage['isAnimating'] = false;
    messages.refresh();

    isSending.value = false;
    await _saveMessages();
    _scrollToBottom();
  }

  void updateTextInput(String text) {
    hasTextInput.value = text.trim().isNotEmpty;
  }

  String _generateBotResponse(String userMessage) {
    final responses = [
      "That's interesting! Tell me more.",
      "I understand. How can I assist you further?",
      "Thanks for sharing that with me!",
      "Got it! What else would you like to know?",
      "I'm here to help. What's your next question?",
    ];
    return responses[DateTime.now().millisecond % responses.length];
  }

  /// Audio recording start
  Future<void> startRecording() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        final Directory appDir = await getApplicationDocumentsDirectory();
        final String filePath =
            '${appDir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';

        await _audioRecorder.start(
          const RecordConfig(encoder: AudioEncoder.aacLc),
          path: filePath,
        );

        _currentRecordingPath = filePath;
        isRecording.value = true;
        recordingDuration.value = 0;

        _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
          recordingDuration.value++;
        });
      }
    } catch (e) {
      print('Error starting recording: $e');
    }
  }

  /// Audio recording stop
  Future<void> stopRecording() async {
    try {
      final path = await _audioRecorder.stop();
      _recordingTimer?.cancel();
      isRecording.value = false;

      if (path != null && _currentRecordingPath != null) {
        final duration = recordingDuration.value;

        messages.add({
          'type': 'user',
          'text': 'Audio Message',
          'time': DateTime.now(),
          'isAudio': true,
          'audioPath': _currentRecordingPath,
          'audioDuration': _formatDuration(duration),
        });

        userScrolling = false;
        await _saveMessages();
        _scrollToBottom();

        await Future.delayed(const Duration(milliseconds: 1500));
        messages.add({
          'type': 'bot',
          'text': "I received your audio message!",
          'time': DateTime.now(),
          'isAnimating': false,
        });

        await _saveMessages();
        _scrollToBottom();
      }

      recordingDuration.value = 0;
    } catch (e) {
      print('Error stopping recording: $e');
    }
  }

  Future<void> playAudio(String? audioPath) async {
    if (audioPath == null) return;

    try {
      await _audioPlayer.play(DeviceFileSource(audioPath));
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(1, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  String formatRecordingDuration() {
    final duration = recordingDuration.value;
    final minutes = duration ~/ 60;
    final secs = duration % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  String formatTime(DateTime time) {
    final hour =
    time.hour > 12 ? time.hour - 12 : (time.hour == 0 ? 12 : time.hour);
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  String formatDateLabel(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final messageDate = DateTime(date.year, date.month, date.day);

    if (messageDate == today) {
      return 'Today';
    } else if (messageDate == yesterday) {
      return 'Yesterday';
    } else if (now.difference(messageDate).inDays < 7) {
      final weekdays = [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday',
      ];
      return weekdays[date.weekday - 1];
    } else {
      final months = [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
      ];
      return '${months[date.month - 1]} ${date.day}';
    }
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  /// Initial scroll - jumps to bottom instantly without animation
  void _scrollToBottomInitial() {
    if (_hasPerformedInitialScroll) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
        _hasPerformedInitialScroll = true;
      }
    });
  }

  /// Smart scroll function - only scrolls if user hasn't manually scrolled up
  void _scrollToBottom() {
    if (userScrolling) return; // Don't auto-scroll if user is viewing old messages

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}