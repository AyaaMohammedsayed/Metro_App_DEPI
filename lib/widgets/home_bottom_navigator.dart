import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.find();

    return Obx(
      () => BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: controller.currentIndex.value,
        onTap: controller.changePage,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.houseChimney),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.circleExclamation),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.ticketSimple),
            label: 'Tickets',
          ),
        ],
      ),
    );
  }
}

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}
