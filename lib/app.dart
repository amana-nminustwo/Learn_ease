import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:learn_ease/presentation/screens/Onboarding/first_onboarding_screen.dart';
import 'package:learn_ease/presentation/screens/Onboarding/seond_onboarding_screen.dart';
import 'package:learn_ease/presentation/screens/Onboarding/third_onborading_screen.dart';
import 'package:learn_ease/presentation/screens/education_details/education_detail_page.dart';
import 'package:learn_ease/presentation/screens/login/login_auth.dart';
import 'package:learn_ease/presentation/screens/otp/otp_verification_page.dart';
import 'package:learn_ease/presentation/screens/register/register_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LearnEase',
      builder: EasyLoading.init(),
      // home: EducationDetailsPage(),
      // home: LoginAuth(),
      // home:OtpVerificationPage()
      // home: RegisterPage(),
      // home: OnboardingOne(),
      // home: OnboardingSecond(),
      home: OnboardingThird(),
    );
  }
}
