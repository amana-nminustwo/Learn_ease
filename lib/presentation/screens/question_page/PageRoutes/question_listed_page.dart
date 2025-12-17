import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/questionPage/pageRoutes/question_controller.dart';
import 'widgets/build_header.dart';
import 'widgets/build_question_list.dart';
import 'widgets/filter_bottom_sheet.dart';
import 'widgets/robot_image.dart';

class QuestionListedPage extends StatelessWidget {
  const QuestionListedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QuestionController>();

    return WillPopScope(
      onWillPop: () async {
        if (controller.isFilterOpen.value) {
          controller.closeFilter();
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F4FF),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  BuildHeader(controller: controller),
                  BuildQuestionList(controller: controller),
                ],
              ),
              // Robot Image
              const RobotImage(),
              // Filter Overlay
              Obx(() => controller.isFilterOpen.value
                  ? GestureDetector(
                onTap: controller.closeFilter,
                child: Container(color: Colors.black.withOpacity(0.5)),
              )
                  : const SizedBox.shrink()),
              // Filter Bottom Sheet
              FilterBottomSheet(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
