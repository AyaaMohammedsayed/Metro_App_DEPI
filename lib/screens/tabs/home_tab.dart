import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro_app/screens/select_station_screen.dart';

import '../../widgets/action_buttons_row.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),

         
              const SizedBox(height: 30),

              // بطاقة خريطة المحطة مع ظل و corners دائرية
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.hardEdge,
                child: InteractiveViewer(
                  boundaryMargin: const EdgeInsets.all(20),
                  minScale: 0.5,
                  maxScale: 3.0,
                  child: Image.asset(
                    'assets/metro_map-removebg-preview.png',
                    height: screenHeight * 0.4,
                    fit: BoxFit.contain ,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const ActionButtonsRow(),

              const Spacer(),

              SizedBox(
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 6,
                    shadowColor: Colors.blue.shade300,
                  ),
                  onPressed: () {
                    Get.to(() =>  SelectStationScreen());
                  },
                  child: const Text(
                    'Select Stations',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
