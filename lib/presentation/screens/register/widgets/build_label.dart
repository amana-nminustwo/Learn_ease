import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelWidget extends StatelessWidget {
  final String text;

  const LabelWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    );
  }
}
