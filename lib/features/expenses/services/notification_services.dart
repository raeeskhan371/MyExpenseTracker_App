import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;
final String uid = _auth.currentUser!.uid;

class NotificationServices {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    NotificationSettings settings = await _messaging.requestPermission();
    print(settings.authorizationStatus);

    final String? token = await _messaging.getToken();
    print("FCM Token:");
    print(token);

    await _firestore.collection("users").doc(uid).set({
      "fcmToken": token,
    }, SetOptions(merge: true));
  }

  // Flutter Local Push Notification

  static Future<void> intilazationNotifiction() async {
    AndroidInitializationSettings androidInit = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    InitializationSettings settings = InitializationSettings(
      android: androidInit,
    );
    await _plugin.initialize(settings: settings);
  }

  //Show Notification

  static Future<void> showNotification({
    required String title,
    required String body,

    String channelId = "default channel",
    String channelName = "General",
  }) async {
    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      "channelId",
      "Basic Notifications",
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails details = NotificationDetails(android: androidDetails);
    int id = Random().nextInt(100000);

    await _plugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: details,
    );
    print("Notification ID:$id ");
  }
}
