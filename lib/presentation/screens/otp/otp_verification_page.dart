import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_ease/presentation/screens/otp/widgets/verify_button.dart';
import '../../controllers/otp/otp_controller.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OtpController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button
                Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 25),
                    Column(
                      children: [
                        SizedBox(height: 5),
                        Text(
                          "OTP Verification",
                          style: TextStyle(
                            fontFamily: 'Mooxy',
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                Container(
                  width: double.infinity, // take full screen width
                  height: MediaQuery.of(context).size.height * 0.40, // 45% o
                  child: Center(
                    child: Image.asset(
                      'assets/images/keyboy.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                Text(
                  "Enter OTP",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    color: const Color(0xFF8066FF),
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return Obx(() {
                      final filled = controller.otpFilled[index].value;
                      return SizedBox(
                        width: 48,
                        height: 55,
                        child: TextField(
                          controller: controller.otpControllers[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            counterText: "",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: filled
                                    ? controller.activeColor
                                    : controller.inactiveColor,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: controller.activeColor,
                                width: 1,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 5) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      );
                    });
                  }),
                ),

                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text("Resend OTP in 30s",
                    style: GoogleFonts.inter(
                      color: const Color(0xFF909AFF),
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),),
                ),

                const SizedBox(height: 40),
                const VerifyButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
