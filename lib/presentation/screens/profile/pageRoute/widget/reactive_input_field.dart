import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../controllers/profile/profile_controller.dart';

class ReactiveInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String fieldKey;
  final TextInputType? keyboardType;
  final String? placeholder;

  const ReactiveInputField({
    super.key,
    required this.label,
    required this.controller,
    required this.fieldKey,
    this.keyboardType,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();

    return Obx(() {
      final isFocused = profileController.focusedField.value == fieldKey;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isFocused ? const Color(0xFF8066FF) : Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: isFocused
                    ? const Color(0xFF8066FF)
                    : const Color(0xFFC8C5C5).withOpacity(0.5),
                width: 1.8,
              ),
            ),
            child: FocusScope(
              child: Focus(
                onFocusChange: (hasFocus) {
                  if (hasFocus) {
                    profileController.setFocusedField(fieldKey);
                  } else {
                    profileController.clearFocus();
                  }
                },
                child: TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: placeholder,
                    hintStyle: GoogleFonts.inter(color: Colors.grey[400]),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
