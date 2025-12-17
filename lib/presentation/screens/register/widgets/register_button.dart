import 'dart:developer';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("registration succeeded..!");
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          color: const Color(0xFF8066FF), // Purple button color
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            "Register",
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
