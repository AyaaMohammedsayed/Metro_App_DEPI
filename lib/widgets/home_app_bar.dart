import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro_app/Notification/presentation/notification_settings.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
       
      titleSpacing: 0,
     backgroundColor: Colors.white,
      leading: Image.asset('assets/logo.png'),
      title: const Text(
        'Metro Guide',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none, size: 26),
          onPressed: () {
       
            Get.to(() => const NotificationSettings());
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
