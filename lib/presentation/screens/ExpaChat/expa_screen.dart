import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_ease/presentation/screens/ExpaChat/widget/botmsg.dart';
import 'package:learn_ease/presentation/screens/ExpaChat/widget/usermsg.dart';
import 'package:learn_ease/presentation/screens/ExpaChat/widget/input_bar.dart';
import 'package:learn_ease/presentation/screens/question_page/PageRoutes/question_listed_page.dart';
import '../../controllers/expaScreen/expa_controller.dart';

class ExpaScreen extends StatelessWidget {
  ExpaScreen({super.key});

  final TextEditingController msgCtrl = TextEditingController();
  // final ExpaController ctrl = Get.put(ExpaController());
  final ExpaController ctrl = Get.put(ExpaController(), tag: 'ExpaScreen', permanent: false);
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: Colors.black,
                      ),
                      padding: EdgeInsets.zero,
                      onPressed: () => Get.to(() => QuestionListedPage()),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Chat with Expa',
                      style: const TextStyle(
                        fontFamily: 'Mooxy',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        letterSpacing: 1.2,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  controller: ctrl.scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount: ctrl.messages.length,
                  itemBuilder: (context, index) {
                    final msg = ctrl.messages[index];
                    final isUser = msg['type'] == 'user';
                    final text = msg['text'] ?? '';
                    final time = msg['time'] as DateTime;
                    final isAudio = msg['isAudio'] ?? false;
                    final audioDuration = msg['audioDuration'] ?? '';

                    bool showDate = false;
                    String dateLabel = '';
                    if (index == 0 ||
                        !ctrl.isSameDay(time, ctrl.messages[index - 1]['time'])) {
                      showDate = true;
                      dateLabel = ctrl.formatDateLabel(time);
                    }

                    return Column(
                      children: [
                        if (showDate)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              dateLabel,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF888888),
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: isUser
                              ? UserMessage(
                            message: text,
                            time: ctrl.formatTime(time),
                            isAudio: isAudio,
                            audioDuration: audioDuration,
                            onPlayAudio: isAudio
                                ? () => ctrl.playAudio(msg['audioPath'])
                                : null,
                          )
                              : BotMessage(
                            message: text,
                            time: ctrl.formatTime(time),
                            isAnimating: msg['isAnimating'] ?? false,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
            ),
            InputBar(
              msgCtrl: msgCtrl,
              focusNode: focusNode,
              ctrl: ctrl,
            ),
          ],
        ),
      ),
    );
  }
}
