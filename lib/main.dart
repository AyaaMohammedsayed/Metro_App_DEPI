import 'package\:flutter/material.dart';
import 'package\:flutter\_local\_notifications/flutter\_local\_notifications.dart';
import 'package\:get/get.dart';
import 'package\:flutter\_screenutil/flutter\_screenutil.dart'; // أضف هذا السطر
import 'package\:metro\_app/screens/splash\_screen.dart';
import 'package\:metro\_app/screens/update\_screen.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();

const AndroidInitializationSettings initializationSettingsAndroid =
AndroidInitializationSettings('@mipmap/ic\_launcher');

final InitializationSettings initializationSettings = InitializationSettings(
android: initializationSettingsAndroid,
);
await flutterLocalNotificationsPlugin.initialize(
initializationSettings,
onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
final String? payload = notificationResponse.payload;
if (payload != null) {
Get.to(() => const UpdateScreen());
}
},
);

runApp(const MetroGuideApp());
}

class MetroGuideApp extends StatelessWidget {
const MetroGuideApp({super.key});

@override
Widget build(BuildContext context) {
return ScreenUtilInit(
designSize: const Size(375, 812), // عدل القيم حسب تصميمك
minTextAdapt: true,
splitScreenMode: true,
builder: (context, child) {
return GetMaterialApp(
debugShowCheckedModeBanner: false,
home: SplashScreen(),
);
},
);
}
}
