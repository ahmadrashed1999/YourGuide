// ignore_for_file: prefer_const_constructors

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:yourguide/component/constant/colors.dart';

class Task {
  final int? id;
  final String title;
  final String description;
  final int color;
  final String day;
  final String hour;
  final DateTime time;
  final String notificationid;
  late final int done;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.color,
    required this.day,
    required this.hour,
    required this.time,
    required this.notificationid,
    required this.done,
  });
  factory Task.fromJson(Map<dynamic, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      color: int.parse(json['color']),
      day: json['day'],
      hour: json['hour'],
      time: DateTime.parse(json['time']),
      notificationid: json['notificationid'],
      done: json['done'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'color': color,
      'day': day,
      'hour': hour,
      'time': time.toIso8601String(),
      'notificationid': notificationid,
      'done': done,
    };
  }
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void cancelTheNotificaton(notificationId) {
  flutterLocalNotificationsPlugin.cancel(int.parse(notificationId));
}

// void scheduleNotification(
//     notificationId, time, title, day, hour, description) async {
//   // Request notification permission
//   flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.requestPermission();

//   // Initialize the plugin
//   var initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');
//   var initSettings =
//       InitializationSettings(android: initializationSettingsAndroid);
//   flutterLocalNotificationsPlugin.initialize(initSettings);

//   // Schedule a notification
//   var notificationInterval = const Duration(days: 1);
//   var currentTime = DateTime.now();
//   while (currentTime.isBefore(time)) {
//     if (currentTime.isAtSameMomentAs(time) ||
//         currentTime.isAfter(time.subtract(Duration(minutes: 5))) &&
//             currentTime.isBefore(time)) {
//       // Send the notification
//       var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//           notificationId, notificationId,
//           channelDescription: description,
//           priority: Priority.high,
//           importance: Importance.max);
//       // ignore: deprecated_member_use
//       await flutterLocalNotificationsPlugin.schedule(
//         0,
//         'تذكير بالمهمة: $title',
//         '$day, $hour: $description',
//         time,
//         NotificationDetails(android: androidPlatformChannelSpecifics),
//         payload: 'item x',
//       );
//       break;
//     }

//     var scheduledNotificationDateTime = currentTime.add(notificationInterval);
//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//         notificationId, notificationId,
//         channelDescription: description,
//         priority: Priority.high,
//         importance: Importance.max);
//     // ignore: deprecated_member_use
//     await flutterLocalNotificationsPlugin.schedule(
//       0,
//       'تذكير بالمهمة: $title',
//       '$day, $hour: $description',
//       scheduledNotificationDateTime,
//       NotificationDetails(android: androidPlatformChannelSpecifics),
//       payload: 'item x',
//     );
//     currentTime = currentTime.add(notificationInterval);
//   }
// }

void scheduleNotification(String notificationId, DateTime time, String title,
    String day, String hour, String description) async {
  // Request notification permission
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestPermission();

  // Initialize the plugin
  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  var initSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  flutterLocalNotificationsPlugin.initialize(initSettings);

  // Calculate the difference between the selected time and the current time
  Duration difference = time.difference(DateTime.now());

  // If the difference is less than an hour, schedule a single notification for the exact time
  if (difference < Duration(hours: 1)) {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        notificationId, notificationId,
        channelDescription: description,
        priority: Priority.high,
        importance: Importance.max);
    await flutterLocalNotificationsPlugin.schedule(
      0,
      'تذكبر بالمهمة: $title',
      '$day, $hour: $description',
      time,
      NotificationDetails(android: androidPlatformChannelSpecifics),
      payload: 'item x',
    );
  }
  // If the difference is greater than an hour, schedule a daily notification
  else {
    var notificationInterval = Duration(days: 1);
    var currentTime = DateTime.now();
    while (currentTime.isBefore(time)) {
      if (currentTime.isAtSameMomentAs(time) ||
          (currentTime.isAfter(time.subtract(Duration(minutes: 59))) &&
              currentTime.isBefore(time.subtract(Duration(minutes: 1))))) {
        var androidPlatformChannelSpecifics = AndroidNotificationDetails(
            notificationId, notificationId,
            channelDescription: description,
            priority: Priority.high,
            importance: Importance.max);
        await flutterLocalNotificationsPlugin.schedule(
          0,
          'تذكبر بالمهمة: $title',
          '$day, $hour: $description',
          time,
          NotificationDetails(android: androidPlatformChannelSpecifics),
          payload: 'item x',
        );
        break;
      }
      var scheduledNotificationDateTime = currentTime.add(notificationInterval);
      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          notificationId, notificationId,
          channelDescription: description,
          priority: Priority.high,
          importance: Importance.max);
      await flutterLocalNotificationsPlugin.schedule(
        0,
        'تذكبر بالمهمة: $title',
        '$day, $hour: $description',
        scheduledNotificationDateTime,
        NotificationDetails(android: androidPlatformChannelSpecifics),
        payload: 'item x',
      );
      currentTime = currentTime.add(notificationInterval);
    }
  }
}
