import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metro_app/Notification/presentation/notification_settings.dart';

void main() {
  runApp(metroApp() );
}

class metroApp extends StatelessWidget {
  const metroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit (
         designSize: Size(360, 690),
         minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NotificationSettings(),
      ),
    );
  }
}
