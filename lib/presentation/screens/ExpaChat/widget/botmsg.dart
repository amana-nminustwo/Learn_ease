import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotMessage extends StatelessWidget {
  final String message;
  final String time;
  final bool isAnimating;

  const BotMessage({
    super.key,
    required this.message,
    required this.time,
    this.isAnimating = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF8066FF),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  border: Border.all(color: const Color(0xFFE8EAED), width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        message,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          height: 1.5,
                        ),
                      ),
                    ),
                    if (isAnimating) ...[
                      const SizedBox(width: 6),
                      SizedBox(
                        width: 10,
                        height: 10,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            const Color(0xFF7C6FFF).withOpacity(0.6),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 44),
          child: Text(
            time,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF9CA3AF),
            ),
          ),
        ),
      ],
    );
  }
}
