import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_ease/presentation/screens/ExpaChat/widget/user_audio_message.dart';
import 'package:learn_ease/presentation/screens/ExpaChat/widget/user_text_message.dart';

class UserMessage extends StatelessWidget {
  final String message;
  final String time;
  final bool isAudio;
  final String audioDuration;
  final VoidCallback? onPlayAudio;
  final bool isPlaying;

  const UserMessage({
    super.key,
    required this.message,
    required this.time,
    this.isAudio = false,
    this.audioDuration = '',
    this.onPlayAudio,
    this.isPlaying = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: isAudio
                ? AudioMessage(
              onPlayAudio: onPlayAudio,
              audioDuration: audioDuration,
              isPlaying: isPlaying,
            )
                : TextMessage(message: message),
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Text(
            time,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade500,
            ),
          ),
        ),
      ],
    );
  }
}
