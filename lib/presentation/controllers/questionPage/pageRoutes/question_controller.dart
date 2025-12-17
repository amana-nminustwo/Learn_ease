import 'package:get/get.dart';

class QuestionController extends GetxController {
  var selectedSubject = ''.obs;
  var isFilterOpen = false.obs;

  // Filter options - changed to not open by default
  var selectedMonth = ''.obs;
  var selectedYear = ''.obs;
  var selectedType = ''.obs;

  var questionPapers = <QuestionPaperItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadQuestionPapers();
    // Don't open filter by default
    isFilterOpen.value = false;
  }

  void loadQuestionPapers() {
    // Sample data - replace with your actual data or API call
    questionPapers.value = [
      QuestionPaperItem(
        title: "Question Paper",
        type: "Regular",
        month: "March",
        year: "2025",
      ),
      QuestionPaperItem(
        title: "Question Paper",
        type: "Regular",
        month: "March",
        year: "2025",
      ),
      QuestionPaperItem(
        title: "Question Paper",
        type: "supplementary",
        month: "March",
        year: "2025",
      ),
      QuestionPaperItem(
        title: "Question Paper",
        type: "Regular",
        month: "February",
        year: "2025",
      ),
      QuestionPaperItem(
        title: "Question Paper",
        type: "Regular",
        month: "January",
        year: "2025",
      ),
      QuestionPaperItem(
        title: "Question Paper",
        type: "supplementary",
        month: "December",
        year: "2024",
      ),
      QuestionPaperItem(
        title: "Question Paper",
        type: "Regular",
        month: "November",
        year: "2024",
      ),
      QuestionPaperItem(
        title: "Question Paper",
        type: "supplementary",
        month: "October",
        year: "2024",
      ),
      QuestionPaperItem(
        title: "Question Paper",
        type: "Regular",
        month: "September",
        year: "2024",
      ),
    ];
  }

  void setSubject(String subject) {
    selectedSubject.value = subject;
  }

  void toggleFilter() {
    isFilterOpen.value = !isFilterOpen.value;
  }

  void openFilter() {
    isFilterOpen.value = true;
  }

  void closeFilter() {
    isFilterOpen.value = false;
  }

  // Get unique months from question papers
  List<String> getAvailableMonths() {
    final months = questionPapers.map((paper) => paper.month).toSet().toList();
    months.sort((a, b) {
      final monthOrder = [
        'January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'
      ];
      return monthOrder.indexOf(a).compareTo(monthOrder.indexOf(b));
    });
    return months;
  }

  // Get unique years from question papers
  List<String> getAvailableYears() {
    final years = questionPapers.map((paper) => paper.year).toSet().toList();
    years.sort((a, b) => b.compareTo(a)); // Descending order
    return years;
  }

  // Get unique types from question papers
  List<String> getAvailableTypes() {
    return questionPapers.map((paper) => paper.type).toSet().toList();
  }

  void setMonth(String month) {
    selectedMonth.value = month;
  }

  void setYear(String year) {
    selectedYear.value = year;
  }

  void setType(String type) {
    selectedType.value = type;
  }

  List<QuestionPaperItem> getFilteredPapers() {
    if (selectedMonth.value.isEmpty &&
        selectedYear.value.isEmpty &&
        selectedType.value.isEmpty) {
      return questionPapers;
    }

    return questionPapers.where((paper) {
      bool matchesMonth = selectedMonth.value.isEmpty ||
          paper.month == selectedMonth.value;
      bool matchesYear = selectedYear.value.isEmpty ||
          paper.year == selectedYear.value;
      bool matchesType = selectedType.value.isEmpty ||
          paper.type == selectedType.value;

      return matchesMonth && matchesYear && matchesType;
    }).toList();
  }

  void applyFilters() {
    // Trigger update
    questionPapers.refresh();
  }

  void clearFilters() {
    selectedMonth.value = '';
    selectedYear.value = '';
    selectedType.value = '';
  }

  bool hasActiveFilters() {
    return selectedMonth.value.isNotEmpty ||
        selectedYear.value.isNotEmpty ||
        selectedType.value.isNotEmpty;
  }
}

class QuestionPaperItem {
  final String title;
  final String type;
  final String month;
  final String year;

  QuestionPaperItem({
    required this.title,
    required this.type,
    required this.month,
    required this.year,
  });
}