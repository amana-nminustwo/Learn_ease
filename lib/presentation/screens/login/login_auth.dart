import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginAuth extends StatelessWidget {
  const LoginAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bc_image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Boy image
              SizedBox(height: 155),
              Container(
                width: double.infinity, // take full screen width
                height: MediaQuery.of(context).size.height * 0.46, // 45% of screen height
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/boy.png'),
                    fit: BoxFit.contain, // keeps full image visible without cropping
                    alignment: Alignment.center,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  left: 27
                ),
                child: Text(
                  "Hello,\nWelcome",
                  style: const TextStyle(
                    fontFamily: 'Mooxy', // ← changed here
                    color: Colors.white,
                    fontSize: 63,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                )
              ),

              const SizedBox(height: 30),

              // Sign in with Google container
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/google.png',
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Continue with Google',
                        style: GoogleFonts.inter(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
