import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../question_detail_page.dart';

class QuestionListTile extends StatelessWidget {
  final dynamic paper; // Replace with your model if available

  const QuestionListTile({super.key, required this.paper});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () {
          Get.to(() => QuestionDetailPage(
            title: "Network Theory - Questions",
            questions: [
              QuestionItem(
                text: "Answer the following questions: (2 × 10)\n\n"
                    "a) Draw the V–I characteristics of ideal and practical voltage and current sources.",
              ),
              QuestionItem(
                text: "b) Determine the equivalent resistance between a–b terminals "
                    "of the network shown in Figure 1 using series and parallel concepts.",
                image: "assets/images/circuit_eg.png",
              ),
              QuestionItem(
                text: "c) Explain Thevenin’s theorem with a neat diagram.",
              ),
              QuestionItem(
                text: "Answer the following questions: (2 × 10)\n\n"
                    "a) Draw the V–I characteristics of ideal and practical voltage and current sources.",
              ),
              QuestionItem(
                text: "b) Determine the equivalent resistance between a–b terminals "
                    "of the network shown in Figure 1 using series and parallel concepts.",
                image: "assets/images/circuit_eg.png",
              ),
              QuestionItem(
                text: "c) Explain Thevenin’s theorem with a neat diagram.",
              ),
            ],
          ));
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.11),
                blurRadius: 10,
                offset: const Offset(0, 9),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      paper.title ?? "No Title", // ✅ null-aware operator
                      style: const TextStyle(
                        fontFamily: 'Mooxy',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      paper.type ?? "No Type", // ✅ null-aware operator
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "${paper.month ?? ''} ${paper.year ?? ''}", // ✅ null-aware
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
