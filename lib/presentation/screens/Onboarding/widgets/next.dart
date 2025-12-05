import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        log("go to next page");
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8066FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        "Next",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Mooxy',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
