import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controllers/ModulePage/module_desc_controller.dart';
import '../../Homescreen/home.dart';

class ModuleDescPage extends StatelessWidget {
  const ModuleDescPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ModuleDescController(), permanent: true);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFF3F4FF),
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4FF),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller.scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Top bar
              Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black87,
                        size: 20,
                      ),
                      onPressed: () => Get.back(),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    "Module 1",
                    style: TextStyle(
                      fontFamily: 'Mooxy',
                      fontSize: 28,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // 🔹 Banner image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/python_banner.png',
                  width: double.infinity,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Section 1: Introduction
              Text(
                "Introduction to python",
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Python is a high-level, interpreted programming language known for its simplicity, readability, and versatility. "
                    "It was created by Guido van Rossum and first released in 1991. The language emphasizes code readability through "
                    "the use of clear and concise syntax, which makes it an excellent choice for beginners as well as experienced developers. "
                    "Unlike low-level languages that require managing complex details such as memory allocation, Python allows programmers to "
                    "focus on solving problems and building applications efficiently.",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.justify,
              ),

              const SizedBox(height: 25),

              // 🔹 Section 2: Strengths
              Row(
                key: controller.strengthsKey,
                children: [
                  Expanded(
                    child: Text(
                      "Strengths",
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () => controller.togglePin("strengths"),
                      child: Image.asset(
                        controller.pinnedSection.value == "strengths"
                            ? 'assets/images/black_pin.png'
                            : 'assets/images/pin.png',
                        width: 22,
                        height: 22,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "One of the key strengths of Python is its portability and extensive standard library. "
                "Python can run on multiple operating systems such as Windows, macOS, and Linux without requiring major changes to the code. "
                "Its rich collection of libraries and frameworks, including tools for data analysis, web development, artificial intelligence, "
                "and automation, make it one of the most widely used languages in modern computing.",
                style: GoogleFonts.inter(fontSize: 20, color: Colors.black87),textAlign: TextAlign.justify,
              ),

              const SizedBox(height: 25),

              // 🔹 Section 3: Libraries
              Row(
                key: controller.librariesKey,
                children: [
                  Expanded(
                    child: Text(
                      "Libraries",
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () => controller.togglePin("libraries"),
                      child: Image.asset(
                        controller.pinnedSection.value == "libraries"
                            ? 'assets/images/black_pin.png'
                            : 'assets/images/pin.png',
                        width: 22,
                        height: 22,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Popular libraries like NumPy, Pandas, TensorFlow, and Django have made Python a dominant language in scientific computing, "
                "machine learning, and web development. Python supports multiple programming paradigms such as procedural, object-oriented, "
                "and functional programming. This flexibility allows developers to choose the most appropriate approach for their projects. "
                "Python’s open-source nature and strong global community ensure continuous improvement, vast documentation, and support.",
                style: GoogleFonts.inter(fontSize: 20, color: Colors.black87),textAlign: TextAlign.justify,
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
