import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/questionPage/pageRoutes/question_controller.dart';
import 'PageRoutes/question_listed_page.dart';
import 'widgets/question_card.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuestionController());
    final questionPapers = [
      QuestionPaperModel(
        title: "Python Question Paper",
        color: const Color(0xFF6499DF),
        image: "assets/images/blue_r.png",
        subject: "Python",
      ),
      QuestionPaperModel(
        title: "Java Question Paper",
        color: const Color(0xFFCB97FF),
        image: "assets/images/purple_r.png",
        subject: "Java",
      ),
      QuestionPaperModel(
        title: "C++ Question Paper",
        color: const Color(0xFFFFBB00),
        image: "assets/images/light_orange_r.png",
        subject: "C++",
      ),
      QuestionPaperModel(
        title: "HTML Question Paper",
        color: const Color(0xFFFF4C30),
        image: "assets/images/red_orange_r.png",
        subject: "HTML",
      ),
      QuestionPaperModel(
        title: "React Question Paper",
        color: const Color(0xFF5DCE1C),
        image: "assets/images/green_r.png",
        subject: "React",
      ),
      QuestionPaperModel(
        title: "Flutter Question Paper",
        color: const Color(0xFFDF64B2),
        image: "assets/images/pink_r.png",
        subject: "Flutter",
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4FF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
              child: Row(
                children: [
                  const Text(
                    "Question Papers",
                    style: TextStyle(
                      fontFamily: 'Mooxy',
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // Cards list
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Column(
                  children: questionPapers.map((paper) {
                    return QuestionCard(
                      paper: paper,
                      onTap: () {
                        // Initialize controller and navigate

                        controller.setSubject(paper.subject);
                        // Don't open filter automatically
                        controller.closeFilter();

                        Get.to(() => const QuestionListedPage());
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}