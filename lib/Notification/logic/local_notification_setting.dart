import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, bool>> loadNotificationSettings() async {
  final prefs = await SharedPreferences.getInstance();
  return {
    'isAlertMode': prefs.getBool('isAlertMode') ?? false,
    'isSoundMode': prefs.getBool('isSoundMode') ?? false,
    'isViberateMode': prefs.getBool('isViberateMode') ?? false,
  };
}
