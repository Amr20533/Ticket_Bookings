import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:permission_handler/permission_handler.dart';

class NotificationHelper {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static const String channelId = 'Booking_ID';
  static const String channelName = 'Booking_channel';
  static const String channelDescription = 'Booking_Description';

  Future<void> init() async {
    tz.initializeTimeZones();
    if (await checkPermissions()) {
      const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

      const InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: null, // Add iOS settings if needed
      );

      await _flutterLocalNotificationsPlugin.initialize(initializationSettings,);
    } else {
      // Handle the case when permission is denied
      print('Notification permission denied');
    }
  }

  Future<void> showNotification({required int id,required String title,required String body}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        channelId,
        channelName,
        channelDescription: channelDescription,
        importance: Importance.max,
        priority: Priority.high,
        showWhen: true,
        playSound: true
    );

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.show(id, title, body, platformChannelSpecifics);
  }

  Future<void> scheduleNotification({required int id,required String title,required String body, required  DateTime scheduledDate}) async {

    final tz.TZDateTime scheduledTZDateTime = tz.TZDateTime.from(scheduledDate, tz.local);

    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
      playSound: true,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledTZDateTime,
      platformChannelSpecifics,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }


  Future<bool> checkPermissions() async {
    if ((await Permission.notification.request()).isGranted &&
        (await Permission.scheduleExactAlarm.request()).isGranted) {
      print('Notification and exact alarm permissions granted.');
      return true;
    } else {
      print('Notification or exact alarm permissions denied.');
      return false;
    }
  }

}


