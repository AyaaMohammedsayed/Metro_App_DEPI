import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro_app/screens/tabs/home_tab.dart';
import '../widgets/diagonal_painter.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.off(() => HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: DiagonalPainter(),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/FRAME.png'),
                  const Text(
                    "MetroGuide",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Your Smart Transit Companion",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 4, backgroundColor: Colors.blueAccent),
                      SizedBox(width: 8),
                      CircleAvatar(
                          radius: 4, backgroundColor: Colors.blueAccent),
                      SizedBox(width: 8),
                      CircleAvatar(
                          radius: 4, backgroundColor: Colors.blueAccent),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
