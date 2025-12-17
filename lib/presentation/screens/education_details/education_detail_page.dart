import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_ease/presentation/screens/education_details/widgets/custom_drop_down.dart';
import '../../controllers/education_details/education_details_controller.dart';
import 'widgets/submit_button.dart';

class EducationDetailsPage extends StatelessWidget {
  const EducationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EducationDetailsController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
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
                          "Education Details",
                          style: TextStyle(
                            fontFamily: 'Mooxy',
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )

                  ],
                ),
                const SizedBox(height: 30),

                CustomDropdown(
                  hintText: "Select Your Degree",
                  items: controller.degrees,
                  selectedValue: controller.selectedDegree,
                ),

                const SizedBox(height: 20),

                CustomDropdown(
                  hintText: "Select Your University",
                  items: controller.universities,
                  selectedValue: controller.selectedUniversity,
                ),

                const SizedBox(height: 20),

                CustomDropdown(
                  hintText: "Select Your Course",
                  items: controller.courses,
                  selectedValue: controller.selectedCourse,
                ),

                const SizedBox(height: 20),

                CustomDropdown(
                  hintText: "Select Your Scheme",
                  items: controller.schemes,
                  selectedValue: controller.selectedScheme,
                ),

                const SizedBox(height: 20),

                CustomDropdown(
                  hintText: "Select Your Current Semester",
                  items: controller.semesters,
                  selectedValue: controller.selectedSemester,
                ),

                const SizedBox(height: 40),

                SubmitButton(onTap: controller.submitDetails),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
