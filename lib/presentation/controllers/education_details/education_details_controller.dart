import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EducationDetailsController extends GetxController {
  var selectedDegree = ''.obs;
  var selectedUniversity = ''.obs;
  var selectedCourse = ''.obs;
  var selectedScheme = ''.obs;
  var selectedSemester = ''.obs;

  final degrees = [
    'ACCA',
    'BTech',
    'B.com',
    'Bca',
    'Bsc',
    'Bvoc',
    'CA',
  ];

  final universities = [
    'Adhishankara College',
    'Bharat Matha College',
    'Cochin University of Science & Tech',
    'Christ Engineering College Irinjalakuda',
    'Federal Institute of Science & Tech',
    'Rajagiri Institute of Science & Tech',
    'SCMS School of Engineering',
  ];

  final courses = [
    'Computer Science',
    'Electronics',
    'Mechanical',
    'Civil',
    'Electrical',
  ];

  final schemes = [
    '2019 Scheme',
    '2020 Scheme',
    '2021 Scheme',
    '2022 Scheme',
  ];

  final semesters = [
    'Semester 1',
    'Semester 2',
    'Semester 3',
    'Semester 4',
    'Semester 5',
    'Semester 6',
    'Semester 7',
    'Semester 8',
  ];

  void submitDetails() {
    if (selectedDegree.isEmpty ||
        selectedUniversity.isEmpty ||
        selectedCourse.isEmpty ||
        selectedScheme.isEmpty ||
        selectedSemester.isEmpty) {
      Get.snackbar(
        'Incomplete Details',
        'Please fill all fields before submitting.',
        backgroundColor: Colors.redAccent.withOpacity(0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Success',
        'Education details submitted successfully!',
        backgroundColor: Colors.green.withOpacity(0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
