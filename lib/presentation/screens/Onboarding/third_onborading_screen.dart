import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_ease/presentation/screens/Onboarding/widgets/letsgo.dart';

class OnboardingThird extends StatelessWidget {
  const OnboardingThird({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 80),

              // Illustration Image
              Image.asset('assets/images/onboard3.png', height: 400),

              const SizedBox(height: 10),

              // Title
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Personalized for You",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Mooxy',
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Description
              Text(
                "Experience a learning path tailored to your pace, strengths, and goals. Get recommendations that adapt to the way you understand and absorb information.",
                textAlign: TextAlign.start,
                style: GoogleFonts.urbanist(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),

              const Spacer(),

              // "Let's Go" button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(child: Letsgo()), // This now says "Let's Go"
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
