import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StationDropdown extends StatelessWidget {
  final String hint;
  final Icon icon;
  final RxList items;

  const StationDropdown({
    super.key,
    required this.hint,
    required this.icon,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownMenu(menuHeight: 475,
        enableSearch: true,
        enableFilter: true,
        width: double.infinity,
        hintText: hint,
        leadingIcon: icon,
        trailingIcon: const Icon(Icons.search),
        selectedTrailingIcon: const Icon(Icons.search),
        dropdownMenuEntries: [
          for (var item in items) DropdownMenuEntry(value: item, label: item),
        ],
      ),
    );
  }
}
