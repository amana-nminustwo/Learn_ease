import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../controllers/questionPage/pageRoutes/question_controller.dart';
import 'filter_dropdown.dart';

class FilterBottomSheet extends StatelessWidget {
  final QuestionController controller;
  const FilterBottomSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      left: 0,
      right: 0,
      bottom: controller.isFilterOpen.value
          ? 0
          : -MediaQuery.of(context).size.height,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.55,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 20,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Invisible placeholder to balance spacing on the left
                  const SizedBox(width: 60),

                  // Center-aligned Filter text
                  Expanded(
                    child: Center(
                      child: Text(
                        "Filter",
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  // Apply button on the right
                  TextButton(
                    onPressed: () {
                      controller.applyFilters();
                      controller.closeFilter();
                    },
                    child: const Text(
                      "Apply",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF8066FF),
                      ),
                    ),
                  ),
                ],
              ),

            ),

            // Filter Options
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    FilterDropdown(
                      title: "Month",
                      selectedValue: controller.selectedMonth,
                      options: controller.getAvailableMonths(),
                      onChanged: (value) =>
                          controller.setMonth(value ?? ''),
                    ),
                    const SizedBox(height: 16),
                    FilterDropdown(
                      title: "Year",
                      selectedValue: controller.selectedYear,
                      options: controller.getAvailableYears(),
                      onChanged: (value) =>
                          controller.setYear(value ?? ''),
                    ),
                    const SizedBox(height: 16),
                    FilterDropdown(
                      title: "Type",
                      selectedValue: controller.selectedType,
                      options: controller.getAvailableTypes(),
                      onChanged: (value) =>
                          controller.setType(value ?? ''),
                    ),
                    const SizedBox(height: 24),
                    if (controller.hasActiveFilters())
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: controller.clearFilters,
                          style: OutlinedButton.styleFrom(
                            padding:
                            const EdgeInsets.symmetric(vertical: 16),
                            side: const BorderSide(
                              color: Color(0xFF6499DF),
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Clear Filters",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF6499DF),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
