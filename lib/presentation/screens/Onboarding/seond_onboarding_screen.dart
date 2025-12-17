import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_ease/presentation/screens/Onboarding/widgets/next.dart';

class OnboardingSecond extends StatelessWidget {
  const OnboardingSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),

              // Illustration Image
              Image.asset('assets/images/onboard2.png', height: 400),

              const SizedBox(height: 10),

              // Title
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Practise & Improve",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Mooxy',
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Description
              Text(
                "Strengthen your knowledge through engaging quizzes, repeated practice, and guided revision.Master every chapter with confidence as you correct mistakes and improve continuously.",
                textAlign: TextAlign.start,
                style: GoogleFonts.urbanist(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),

              const Spacer(),

              // Buttons Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(child: NextButton()),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
