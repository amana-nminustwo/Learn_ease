import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  // 6 OTP text controllers
  final otpControllers = List.generate(6, (_) => TextEditingController());

  // Reactive list of booleans to track filled boxes
  final otpFilled = List.generate(6, (_) => false.obs);

  // Colors
  final Color activeColor = const Color(0xFF8066FF);
  final Color inactiveColor = Colors.grey.shade300;

  @override
  void onInit() {
    super.onInit();
    for (int i = 0; i < otpControllers.length; i++) {
      otpControllers[i].addListener(() {
        otpFilled[i].value = otpControllers[i].text.isNotEmpty;
      });
    }
  }

  @override
  void onClose() {
    for (var c in otpControllers) {
      c.dispose();
    }
    super.onClose();
  }
}
