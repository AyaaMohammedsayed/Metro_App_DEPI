import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metro_app/Notification/data/button.dart';
import 'package:metro_app/Notification/logic/saved_data.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool isSwitchedAlret = false;
  bool isSwitchedViberate = false;
  bool isSwitchedSound = false;

  final player = AudioPlayer();
    Future<void> loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isSwitchedSound = prefs.getBool('isSoundMode') ?? false;
      isSwitchedViberate = prefs.getBool('isViberateMode') ?? false;
      isSwitchedAlret = prefs.getBool('isAlertMode') ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();  // استدعاء دالة تحميل البيانات عند بداية الصفحة
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 240, 240),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Notification Settings",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.notifications,
                        size: 20,
                        color: Color(0xff007AFF),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Station Proximity Alert",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Switch(
                        value: isSwitchedAlret,
                        trackOutlineColor: MaterialStateProperty.all(
                          Color(0xff007AFF),
                        ),
                        activeColor: Color(0xffffffff),
                        activeTrackColor: Color(0xff007AFF),
                        inactiveThumbColor: Color(0xff007AFF),
                        inactiveTrackColor: Color(0xffffffff),
                   onChanged: (value) async {
  setState(() {
    isSwitchedAlret = value;
  });
  await saveData(
    isSwitchedSound: isSwitchedSound,
    isSwitchedViberate: isSwitchedViberate,
    isSwitchedAlret: isSwitchedAlret,
  );
},


                            
                      ),
                      
                    ],
                  ),

                  Text(
                    "Get notified when you're near your\n destination",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 30,
                        color: Color(0xff007AFF),
                      ),
                      Text(
                        "Alert Distance",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 30.w),
                      Text(
                        "100 meters",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 30.w),
                      Text(
                        "You'll be notified when you're\n this far from your destination",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.w),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.notifications_outlined,
                        size: 20,
                        color: Color(0xff007AFF),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Vibrate",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Spacer(),
                      Switch(
                        value: isSwitchedViberate,

                        activeColor: Color(0xffffffff),
                        trackOutlineColor: MaterialStateProperty.all(
                          Color(0xff007AFF),
                        ),
                        activeTrackColor: Color(0xff007AFF),
                        inactiveThumbColor: Color(0xff007AFF),
                        inactiveTrackColor: Color(0xffffffff),
                        onChanged: (value) async {
                          setState(() {
                            isSwitchedViberate = value;
                        
                          });
                          if (value) {
                            Vibration.vibrate(duration: 500);
                          }
                            await saveData(
    isSwitchedSound: isSwitchedSound,
    isSwitchedViberate: isSwitchedViberate,
    isSwitchedAlret: isSwitchedAlret,
  );
                        },
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Icon(
                        Icons.volume_up_outlined,
                        size: 20,
                        color: Color(0xff007AFF),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Play Sound",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Spacer(),
                      Switch(
                        value: isSwitchedSound,

                        activeColor: Color(0xffffffff),
                        activeTrackColor: Color(0xff007AFF),
                        trackOutlineColor: MaterialStateProperty.all(
                          Color(0xff007AFF),
                        ),
                        inactiveThumbColor: Color(0xff007AFF),
                        inactiveTrackColor: Color(0xffffffff),

                        onChanged: (value) async {
                          setState(() {
                            isSwitchedSound = value;
                          });
                          if (value) {
                            await player.play(AssetSource('sounds/sound.wav'));
                          }
                            await saveData(
    isSwitchedSound: isSwitchedSound,
    isSwitchedViberate: isSwitchedViberate,
    isSwitchedAlret: isSwitchedAlret,
  );
                      
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),

        ],
      ),
    );
  }
}
