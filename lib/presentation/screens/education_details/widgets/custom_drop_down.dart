import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdown extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final RxString selectedValue;

  const CustomDropdown({
    super.key,
    required this.hintText,
    required this.items,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => GestureDetector(
        onTap: () {
          _showCustomDropdown(context);
        },
        child: Container(
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedValue.value.isEmpty ? hintText : selectedValue.value,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: selectedValue.value.isEmpty
                      ? Colors.grey.shade600
                      : Colors.black87,
                ),
              ),
              const Icon(Icons.keyboard_arrow_down_rounded,
                  color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  /// Custom dropdown popup
  void _showCustomDropdown(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black12,
      builder: (context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              constraints: const BoxConstraints(
                maxHeight: 350,
              ),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  )
                ],
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final isSelected = selectedValue.value == item;

                  return GestureDetector(
                    onTap: () {
                      selectedValue.value = item;
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.grey.shade200
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        item,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
