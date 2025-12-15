import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controllers/Home/home_controller.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      final weekDates = controller.currentWeekDates;
      final selectedDate = controller.selectedDate.value;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(weekDates.length, (index) {
          final date = weekDates[index];
          final bool isSelected =
              date.day == selectedDate.day && date.month == selectedDate.month;

          return GestureDetector(
            onTap: () => controller.selectDate(date),
            child: Container(
              width: 45,
              height: 60,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF8066FF) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.formatDate(date),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    controller.formatDay(date),
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: isSelected ? Colors.white : Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      );
    });
  }
}
