import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:metro_app/Notification/logic/local_notification_setting.dart';
import 'package:metro_app/main.dart';

Future<void> showProximityNotification() async {
  final settings = await loadNotificationSettings();

  if (!settings['isAlertMode']!) return;

  final bool isSound = settings['isSoundMode']!;
  final bool isVibrate = settings['isViberateMode']!;
  final String channelId = generateChannelId(isSound, isVibrate);

  final AndroidNotificationChannel channel = AndroidNotificationChannel(
    channelId,
    'Metro Alert ($channelId)',
    description: 'Notification channel for metro alerts: $channelId',
    importance: Importance.max,
    playSound: isSound,
    enableVibration: isVibrate,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  final androidDetails = AndroidNotificationDetails(
    channel.id,
    channel.name,
    channelDescription: channel.description,
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
    playSound: isSound,
    enableVibration: isVibrate,
  );

  final notificationDetails = NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.show(
    0,
    'Metro Guide',
    'You are near from your destination!',
    notificationDetails,
    payload: 'update_screen',
  );
}

String generateChannelId(bool isSound, bool isVibrate) {
  if (isSound && isVibrate) return 'metro_sound_vibration';
  if (!isSound && isVibrate) return 'metro_vibration_only';
  if (isSound && !isVibrate) return 'metro_sound_only';
  return 'metro_silent';
}
