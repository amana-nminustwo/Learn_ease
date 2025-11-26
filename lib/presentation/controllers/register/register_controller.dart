import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  // Text Editing Controllers
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();

  // Focus Nodes
  final emailFocus = FocusNode();
  final firstFocus = FocusNode();
  final lastFocus = FocusNode();
  final phoneFocus = FocusNode();

  // Focus states (reactive)
  final emailFocusState = false.obs;
  final firstFocusState = false.obs;
  final lastFocusState = false.obs;
  final phoneFocusState = false.obs;

  // Form Validity
  final formValid = false.obs;

  // Active color
  final Color activeColor = const Color(0xFF8066FF);

  @override
  void onInit() {
    super.onInit();
    _setupFocusListeners();
    _setupTextListeners();
  }

  void _setupFocusListeners() {
    emailFocus.addListener(() => emailFocusState.value = emailFocus.hasFocus);
    firstFocus.addListener(() => firstFocusState.value = firstFocus.hasFocus);
    lastFocus.addListener(() => lastFocusState.value = lastFocus.hasFocus);
    phoneFocus.addListener(() => phoneFocusState.value = phoneFocus.hasFocus);
  }

  void _setupTextListeners() {
    emailController.addListener(_checkForm);
    firstNameController.addListener(_checkForm);
    lastNameController.addListener(_checkForm);
    phoneController.addListener(_checkForm);
  }

  void _checkForm() {
    final valid =
        emailController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        RegExp(r'^[0-9]{10}$').hasMatch(phoneController.text);

    formValid.value = valid;
  }

  @override
  void onClose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();

    emailFocus.dispose();
    firstFocus.dispose();
    lastFocus.dispose();
    phoneFocus.dispose();
    super.onClose();
  }
}
