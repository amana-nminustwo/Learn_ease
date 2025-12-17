import 'dart:developer';
import 'package:flutter/material.dart';

class Letsgo extends StatelessWidget {
  const Letsgo({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Get.to((
        //
        // ));
        log("go to homescreen");
      },

      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8066FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        "Let's Go",
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
