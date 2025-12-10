import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:learn_ease/presentation/screens/Homescreen/home_screen.dart';
import 'package:learn_ease/presentation/screens/ModulePage/PageRoute/module_desc_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LearnEase',
      builder: EasyLoading.init(),
      home: HomeScreen(),
      // home: ModuleDescPage(),
    );
  }
}
