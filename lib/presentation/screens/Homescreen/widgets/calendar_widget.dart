import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final dates = [17, 18, 19, 20, 21, 22, 23];
    final bool isSelected = true; // you can later connect it dynamically

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(7, (index) {
        final bool selected = dates[index] == 18; // e.g. current day
        return Container(
          width: 45,
          height: 60,
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF8066FF) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dates[index].toString(),
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                days[index],
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: selected ? Colors.white : Colors.grey.shade500,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
