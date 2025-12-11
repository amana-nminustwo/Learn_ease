import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_ease/presentation/screens/Homescreen/home_screen.dart';
import '../../../../controllers/questionPage/pageRoutes/question_controller.dart';

class BuildHeader extends StatelessWidget {
  final QuestionController controller;

  const BuildHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      child: Row(
        children: [
          // Back Button
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey.shade300, // 👈 light grey border
                width: 1.5, // thickness of the border
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 18),
              onPressed: () => Get.to(() => HomeScreen()),
              padding: EdgeInsets.zero,
            ),
          ),
          const Spacer(),
          // Filter Button
          Container(
            width: 44,
            height: 44,
            color: Colors.transparent,
            child: IconButton(
              onPressed: controller.toggleFilter,
              padding: EdgeInsets.zero,
              icon: Image.asset(
                'assets/images/filter.png',
                width: 33,
                height: 33,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
