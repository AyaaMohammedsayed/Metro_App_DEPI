import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StationDropdown extends StatelessWidget {
  final String hint;
  final Icon icon;
  final RxList<String> items;
  final RxString selectedStation;

  const StationDropdown({
    super.key,
    required this.hint,
    required this.icon,
    required this.items,
    required this.selectedStation,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownMenu<String>(
        menuHeight: 475,
        enableSearch: true,
        enableFilter: true,
        width: double.infinity,
        hintText: hint,
        leadingIcon: icon,
        trailingIcon: const Icon(Icons.search),
        selectedTrailingIcon: const Icon(Icons.check),
        initialSelection: selectedStation.value.isEmpty ? null : selectedStation.value,
        onSelected: (value) {
          if (value != null) {
            selectedStation.value = value;
          }
        },
        dropdownMenuEntries: items
            .map((item) => DropdownMenuEntry(value: item, label: item))
            .toList(),
      );
    });
  }
}
