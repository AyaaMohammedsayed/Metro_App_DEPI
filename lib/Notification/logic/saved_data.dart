import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveData({required bool isSwitchedSound,required bool isSwitchedViberate,required bool isSwitchedAlret}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  

  await prefs.setBool('isSoundMode', isSwitchedSound);
  await prefs.setBool('isViberateMode', isSwitchedViberate);
  await prefs.setBool('isAlertMode', isSwitchedAlret);

}
