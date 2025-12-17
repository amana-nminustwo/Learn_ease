import 'package:flutter/material.dart';

class QuestionPaperModel {
  final String title;
  final Color color;
  final String image;final String subject;

  QuestionPaperModel({
    required this.title,
    required this.color,
    required this.image,required this.subject,
  });
}

class QuestionCard extends StatelessWidget {
  final QuestionPaperModel paper;
  final VoidCallback onTap;

  const QuestionCard({
    super.key,
    required this.paper,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: Ink(
            height: 80,
            decoration: BoxDecoration(
              color: paper.color,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Positioned image at bottom-right
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(24),
                    ),
                    child: Image.asset(
                      paper.image,
                      width: 70,
                      height: 70,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Title text
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 24,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      paper.title,
                      style: const TextStyle(
                        fontFamily: 'Mooxy',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
