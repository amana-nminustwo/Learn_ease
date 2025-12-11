import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/questionPage/pageRoutes/question_controller.dart';

class RobotImage extends StatelessWidget {
  const RobotImage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QuestionController>();

    return Obx(() => !controller.isFilterOpen.value
        ? Positioned(
      right: 20,
      bottom: 20,
      child: Image.asset(
        'assets/images/robot.png',
        width: 65,
        height: 65,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.smart_toy,
              size: 50,
              color: Colors.grey[600],
            ),
          );
        },
      ),
    )
        : const SizedBox.shrink());
  }
}
