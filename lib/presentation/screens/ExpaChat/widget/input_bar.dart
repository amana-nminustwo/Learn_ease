import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_ease/presentation/screens/ExpaChat/widget/recording_indicator.dart';
import 'package:learn_ease/presentation/screens/ExpaChat/widget/action_button.dart';
import '../../../controllers/expaScreen/expa_controller.dart';

class InputBar extends StatelessWidget {
  final TextEditingController msgCtrl;
  final FocusNode focusNode;
  final ExpaController ctrl;

  const InputBar({
    super.key,
    required this.msgCtrl,
    required this.focusNode,
    required this.ctrl,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isRecording = ctrl.isRecording.value;
      final hasText = ctrl.hasTextInput.value;

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(
                    minHeight: 48,
                    maxHeight: 120,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: isRecording
                          ? const Color(0xFF8066FF).withOpacity(0.5)
                          : Colors.grey.shade300,
                      width: 1.5,
                    ),
                  ),
                  child: isRecording
                      ? const RecordingIndicator()
                      : Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: msgCtrl,
                          focusNode: focusNode,
                          maxLines: null,
                          textInputAction: TextInputAction.newline,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            color: Colors.black,
                            height: 1.4,
                          ),
                          onChanged: (text) {
                            ctrl.updateTextInput(text);
                          },
                          decoration: InputDecoration(
                            hintText: "Send a message.",
                            hintStyle: GoogleFonts.inter(
                              fontSize: 15,
                              color: const Color(0xFFAAAAAA),
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                            ),
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              if (isRecording) ...[
                ActionButton(
                  icon: Icons.stop_circle,
                  color: Colors.red,
                  size: 48,
                  onTap: ctrl.stopRecording,
                ),
              ] else if (hasText) ...[
                ActionButton(
                  icon: Icons.send_rounded,
                  color: const Color(0xFF8066FF),
                  size: 48,
                  onTap: () {
                    if (msgCtrl.text.trim().isNotEmpty) {
                      ctrl.sendMessage(msgCtrl.text);
                      msgCtrl.clear();
                      ctrl.updateTextInput('');
                    }
                  },
                ),
              ] else ...[
                ActionButton(
                  icon: Icons.mic,
                  color: const Color(0xFF8066FF),
                  size: 48,
                  onTap: ctrl.startRecording,
                ),
              ],
            ],
          ),
        ),
      );
    });
  }
}
