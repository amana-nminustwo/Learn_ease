import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterDropdown extends StatelessWidget {
  final String title;
  final RxString selectedValue;
  final List<String> options;
  final Function(String?) onChanged;

  const FilterDropdown({
    super.key,
    required this.title,
    required this.selectedValue,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFD1D3F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue.value.isEmpty ? null : selectedValue.value,
          hint: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF2F2965),
            ),
          ),
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFF2F2965),
          ),
          dropdownColor: const Color(0xFFD1D3F5),
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2F2965),
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    ));
  }
}
