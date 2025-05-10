import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:metro_app/screens/splash_screen.dart';

void main() => runApp(const MetroGuideApp());

class MetroGuideApp extends StatelessWidget {
  const MetroGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
