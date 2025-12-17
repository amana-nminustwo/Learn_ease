import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../controllers/questionPage/pageRoutes/question_controller.dart';
import '../../../ExpaChat/expa_screen.dart';

class RobotImage extends StatelessWidget {
  const RobotImage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QuestionController>();

    return Obx(
      () => !controller.isFilterOpen.value
          ? Positioned(
              right: 20,
              bottom: 20,
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => ExpaScreen(),
                    transition: Transition.zoom,
                    duration: const Duration(milliseconds: 400),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF7C6FFF).withOpacity(0.4),
                        blurRadius: 20,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child:
                      Image.asset(
                            'assets/images/robot.png',
                            width: 70,
                            height: 70,
                            fit: BoxFit.contain,
                          )
                          .animate(onPlay: (controller) => controller.repeat())
                          // .fadeIn(duration: 10.ms)
                          .then(delay: 300.ms)
                          .scale(
                            begin: const Offset(1.0, 1.0),
                            end: const Offset(1.1, 1.1),
                            duration: 700.ms,
                            curve: Curves.easeInOut,
                          )
                          .then(delay: 200.ms)
                          .scale(
                            begin: const Offset(1.1, 1.1),
                            end: const Offset(1.0, 1.0),
                            duration: 700.ms,
                            curve: Curves.easeInOut,
                          ),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
