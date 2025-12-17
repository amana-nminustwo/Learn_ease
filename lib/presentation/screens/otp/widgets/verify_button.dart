import 'dart:developer';
import 'package:flutter/material.dart';

class VerifyButton extends StatelessWidget {
  const VerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("otp verified successfully");
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          color: const Color(0xFF8066FF),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            "Verify",
            style: TextStyle(
              fontFamily: 'Mooxy',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
