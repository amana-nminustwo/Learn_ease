import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:learn_ease/presentation/screens/ModulePage/widgets/edgemark_module.dart';
import 'package:learn_ease/presentation/screens/ModulePage/widgets/regular_module.dart' hide EdgemarkModuleTile;
import '../../controllers/Navigation/navigation_controller.dart';

class ModulePage extends StatelessWidget {
  const ModulePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFF3F4FF),
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );

    final navController = Get.find<NavigationController>();

    final List<Map<String, String>> modules = [
      {"id": "1", "title": "Module 1", "subtitle": "Introduction to Python"},
      {"id": "2", "title": "Module 2", "subtitle": "Data Types & Variables"},
      {"id": "3", "title": "Module 3", "subtitle": "Control Structures"},
      {"id": "4", "title": "Module 4", "subtitle": "Functions & Modules"},
      {"id": "5", "title": "Module 5", "subtitle": "File Handling"},
      {
        "id": "EM",
        "title": "Edgemark Modules",
        "subtitle": "Advanced Python Concepts",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button + title
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black87,
                        size: 22,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    "Modules",
                    style: TextStyle(
                      fontFamily: 'Mooxy',
                      fontSize: 28,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // List of modules
              Expanded(
                child: ListView.builder(
                  itemCount: modules.length,
                  itemBuilder: (context, index) {
                    final module = modules[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: module["id"] == "EM"
                          ? EdgemarkModuleTile(
                        id: module["id"]!,
                        title: module["title"]!,
                        subtitle: module["subtitle"]!,
                      )
                          : RegularModuleTile(
                        id: module["id"]!,
                        title: module["title"]!,
                        subtitle: module["subtitle"]!,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
