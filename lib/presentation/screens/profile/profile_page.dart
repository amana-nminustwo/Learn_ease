import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_ease/presentation/screens/profile/pageRoute/edit_profile_page.dart';
import 'package:learn_ease/presentation/screens/profile/widget/profile_menu_item.dart';
import '../../controllers/profile/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: const Color(0xFFE8ECFF),
      body: SafeArea(
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

            // 🔹 Page Title
            const Positioned(
              top: 24,
              left: 24,
              child: Text(
                'Profile',
                style: TextStyle(
                  fontFamily: 'Mooxy',
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),

            // 🔹 White Background
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Profile Image
                        Container(
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
                            child: Image.asset(
                              'assets/images/pic.png',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.person,
                                  color: Colors.white, size: 40),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),

                        // User Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                'John Doe',
                                style: GoogleFonts.inter(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                'john123@gmail.com',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: 140,
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF8066FF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.to(() => const EditProfilePage());
                                  },
                                  child: Text(
                                    'Edit Profile',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Scrollable Menu Section
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          ProfileMenuItem(
                            imagePath: 'assets/images/about.png',
                            title: 'About App',
                            onTap: () {},
                          ),
                          const SizedBox(height: 16),
                          ProfileMenuItem(
                            imagePath: 'assets/images/ask.png',
                            title: 'Help & Support',
                            onTap: () {},
                          ),
                          const SizedBox(height: 16),
                          ProfileMenuItem(
                            imagePath: 'assets/images/settings.png',
                            title: 'Settings',
                            onTap: () {},
                          ),
                          const SizedBox(height: 16),
                          ProfileMenuItem(
                            imagePath: 'assets/images/logout.png',
                            title: 'Log out',
                            onTap: () => controller.logout(),
                          ),
                          const SizedBox(height: 30),
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
    );
  }
}
