import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  // Selected date (default = today)
  Rx<DateTime> selectedDate = DateTime.now().obs;

  // Generate a week starting from Monday of the current week
  List<DateTime> get currentWeekDates {
    DateTime now = DateTime.now();
    int currentWeekday = now.weekday; // 1 = Mon, 7 = Sun
    DateTime monday = now.subtract(Duration(days: currentWeekday - 1));

    return List.generate(7, (index) => monday.add(Duration(days: index)));
  }

  // Change selected date
  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  // Utility: format day name (Mon, Tue, etc.)
  String formatDay(DateTime date) => DateFormat('E').format(date);

  // Utility: format date number
  String formatDate(DateTime date) => DateFormat('d').format(date);
}
