import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metro_app/Notification/logic/saved_data.dart';

class buttonWidget extends StatelessWidget {
  final bool isSwitchedSound;
  final bool isSwitchedViberate;
  final bool isSwitchedAlret ;

  buttonWidget({
    required this.isSwitchedSound,
    required this.isSwitchedViberate,
    required this.isSwitchedAlret,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xff007AFF)),
        maximumSize: MaterialStateProperty.all(Size(340.w, 50.h)),
        minimumSize: MaterialStateProperty.all(Size(340.w, 50.h)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: BorderSide(color: Color(0xff007AFF)),
          ),
        ),
      ),
      onPressed: () async {
        // Save the settings when the button is pressed
        await saveData(
          isSwitchedSound: isSwitchedSound,
          isSwitchedViberate: isSwitchedViberate,
          isSwitchedAlret: isSwitchedAlret,
        );
        // Show a confirmation message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Settings saved successfully!'),
            duration: Duration(seconds: 2),
          ),
        );
      },
      child: Text(
        "Save Settings",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
