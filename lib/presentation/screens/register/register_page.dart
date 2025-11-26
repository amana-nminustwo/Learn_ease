import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_ease/presentation/screens/register/widgets/build_label.dart';
import 'package:learn_ease/presentation/screens/register/widgets/custom_textfield.dart';
import 'package:learn_ease/presentation/screens/register/widgets/register_button.dart';
import '../../controllers/register/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

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
                        border: Border.all(color: Colors.grey.shade200),
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
                          "Register",
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

                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: const LabelWidget(text: "Email"),
                ),
                Obx(
                  () => CustomTextField(
                    hintText: "Enter your email",
                    controller: controller.emailController,
                    focusNode: controller.emailFocus,
                    borderColor: controller.emailFocusState.value
                        ? controller.activeColor
                        : Colors.transparent,
                  ),
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: const LabelWidget(text: "First Name"),
                ),
                Obx(
                  () => CustomTextField(
                    hintText: "Enter your first name",
                    controller: controller.firstNameController,
                    focusNode: controller.firstFocus,
                    borderColor: controller.firstFocusState.value
                        ? controller.activeColor
                        : Colors.transparent,
                  ),
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: const LabelWidget(text: "Last Name"),
                ),
                Obx(
                  () => CustomTextField(
                    hintText: "Enter your last name",
                    controller: controller.lastNameController,
                    focusNode: controller.lastFocus,
                    borderColor: controller.lastFocusState.value
                        ? controller.activeColor
                        : Colors.transparent,
                  ),
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: const LabelWidget(text: "Phone Number"),
                ),
                Obx(
                  () => CustomTextField(
                    hintText: "Eg. 9017271218",
                    controller: controller.phoneController,
                    focusNode: controller.phoneFocus,
                    keyboardType: TextInputType.number,
                    isPhone: true,
                    borderColor: controller.phoneFocusState.value
                        ? controller.activeColor
                        : Colors.transparent,
                  ),
                ),

                const SizedBox(height: 40),
                const RegisterButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
