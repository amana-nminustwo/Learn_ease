import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextMessage extends StatelessWidget {
  final String message;

  const TextMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        height: 1.4,
      ),
    );
  }
}
