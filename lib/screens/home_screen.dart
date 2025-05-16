import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro_app/Notification/presentation/notification_settings.dart';
import 'package:metro_app/screens/tabs/ticket_prices.dart';


import 'package:metro_app/screens/tabs/tickets_tab.dart';
import 'package:metro_app/widgets/home_app_bar.dart';
import '../widgets/home_bottom_navigator.dart';

import 'tabs/home_tab.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final BottomNavController navController = Get.put(BottomNavController());

  final List<Widget> pages = [
    HomeTab(),
    const NotificationSettings(),
   TicketPricesPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
           backgroundColor: Colors.white,
        appBar: const HomeAppBar(),
        body: pages[navController.currentIndex.value],
        bottomNavigationBar: const HomeBottomNavigationBar(),
      );
    });
  }
}
