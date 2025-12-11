import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:learn_ease/presentation/screens/Homescreen/home.dart';
import '../../controllers/Navigation/navigation_controller.dart';
import '../ModulePage/module_page.dart';
import '../Notification/notification_page.dart';
import '../question_page/question_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.put(NavigationController());

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    // icon asset paths
    final List<String> normalIcons = [
      'assets/images/home.png',
      'assets/images/bell.png',
      'assets/images/file.png',
      'assets/images/person.png',
    ];

    final List<String> activeIcons = [
      'assets/images/blue_home.png',
      'assets/images/blue_bell.png',
      'assets/images/blue_file.png',
      'assets/images/blue_person.png',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          return IndexedStack(
            index: navController.selectedIndex.value,
            children: const [
              Home(),
              NotificationPage(),
              QuestionPage(),
              SizedBox(),
            ],
          );
        }),
      ),

      // 👇 Bottom Navigation Bar
      bottomNavigationBar: Obx(() {
        return Container(
          height: 70,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(normalIcons.length, (index) {
              final bool isSelected =
                  navController.selectedIndex.value == index;

              return GestureDetector(
                onTap: () => navController.changeIndex(index: index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: isSelected
                        ? const Border(
                            top: BorderSide(color: Color(0xFF2900EF), width: 4),
                          )
                        : null,
                  ),
                  child: Image.asset(
                    isSelected ? activeIcons[index] : normalIcons[index],
                    width: 28,
                    height: 28,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}
