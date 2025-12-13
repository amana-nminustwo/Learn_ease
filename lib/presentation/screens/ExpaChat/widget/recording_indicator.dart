import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controllers/expaScreen/expa_controller.dart';

class RecordingIndicator extends StatelessWidget {
  const RecordingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<ExpaController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 1000),
            builder: (context, value, child) {
              return Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.withOpacity(0.5 + (value * 0.5)),
                ),
              );
            },
            onEnd: () {},
          ),
          const SizedBox(width: 12),
          Obx(() {
            return Text(
              ctrl.formatRecordingDuration(),
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            );
          }),
          const SizedBox(width: 16),
          Expanded(
            child: SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  30,
                      (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.5),
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(
                        begin: 0.3,
                        end: 1.0,
                      ),
                      duration: Duration(
                        milliseconds: 300 + (index * 50) % 500,
                      ),
                      builder: (context, value, child) {
                        return Container(
                          width: 3,
                          height: ((index % 4) + 1) * 6.0 * value,
                          decoration: BoxDecoration(
                            color: const Color(0xFF8066FF),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        );
                      },
                      onEnd: () {},
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
