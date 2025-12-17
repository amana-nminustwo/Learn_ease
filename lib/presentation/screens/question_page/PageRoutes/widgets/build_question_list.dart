import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/questionPage/pageRoutes/question_controller.dart';
import 'question_list_tile.dart';

class BuildQuestionList extends StatelessWidget {
  final QuestionController controller;

  const BuildQuestionList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        final filteredPapers = controller.getFilteredPapers();

        if (filteredPapers.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  'No question papers found',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
          itemCount: filteredPapers.length,
          itemBuilder: (context, index) {
            final paper = filteredPapers[index];
            return QuestionListTile(paper: paper);
          },
        );
      }),
    );
  }
}
