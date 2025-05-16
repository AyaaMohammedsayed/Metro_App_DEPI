import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro_app/screens/favourite_screen.dart';
import 'package:metro_app/screens/nearst_stations_screen.dart';
import 'package:metro_app/screens/update_screen.dart';
import 'circle_button.dart';

class ActionButtonsRow extends StatelessWidget {
  const ActionButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleButton(
          icon: Icons.near_me,
          label: 'Nearby',
          onPressed: () => Get.to(() => const NearestStationsScreen()),
        ),
        CircleButton(
          icon: Icons.update,
          label: 'Updates',
          onPressed: () => Get.to(() => UpdateScreen()),
        ),
        CircleButton(
          icon: Icons.star,
          label: 'Popular',
          onPressed: () => Get.to(() => PopularScreen()),
        ),
      ],
    );
  }
}
