import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_ease/presentation/screens/Homescreen/home_screen.dart';
import '../../../controllers/profile/profile_controller.dart';
import 'widget/reactive_input_field.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4FF),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // hide keyboard
        child: SafeArea(
          child: Stack(
            children: [
              // 🔹 Background Image
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/profile_bg.png',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),

              // 🔹 Header with Back Button and Title
              Positioned(
                top: 24,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 1.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                        // 🟣 Navigate back to HomeScreen
                        onPressed: () => Get.offAll(() => const HomeScreen()),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontFamily: 'Mooxy',
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              // 🔹 White Background Section (content base)
              Positioned(
                top: 195,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(color: Colors.white),
              ),

              // 🔹 Profile Content
              Positioned.fill(
                top: 140,
                child: Column(
                  children: [
                    // 🟠 Profile Image with Camera Icon
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Obx(
                              () => Container(
                            width: 123,
                            height: 123,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: const LinearGradient(
                                colors: [Color(0xFFFF8C42), Color(0xFFFF6B35)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: controller.profileImage.value.isNotEmpty
                                  ? Image.file(
                                File(controller.profileImage.value),
                                fit: BoxFit.cover,
                              )
                                  : Image.asset(
                                'assets/images/pic.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () => controller.pickImage(),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // 🟣 Scrollable Input Form
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReactiveInputField(
                              label: 'Email',
                              controller: controller.emailController,
                              fieldKey: 'email',
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 20),
                            ReactiveInputField(
                              label: 'First Name',
                              controller: controller.firstNameController,
                              fieldKey: 'firstName',
                            ),
                            const SizedBox(height: 20),
                            ReactiveInputField(
                              label: 'Last Name',
                              controller: controller.lastNameController,
                              fieldKey: 'lastName',
                            ),
                            const SizedBox(height: 20),
                            ReactiveInputField(
                              label: 'Phone Number',
                              controller: controller.phoneNumberController,
                              fieldKey: 'phone',
                              keyboardType: TextInputType.phone,
                              placeholder: 'Eg. 9017271218',
                            ),
                            const SizedBox(height: 32),

                            // 🟩 Save Button
                            SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: ElevatedButton(
                                onPressed: () => controller.saveChanges(),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF7B68EE),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  'Save Changes',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
