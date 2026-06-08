import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;
final String uid = _auth.currentUser!.uid;

class NotificationServices {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    NotificationSettings settings = await _messaging.requestPermission();
    print(settings.authorizationStatus);

    // Get FCM Token

    final String? token = await _messaging.getToken();
    print("FCM Token:");
    print(token);
    // Save Token in Firebase
    await _firestore.collection("users").doc(uid).set({
      "fcmToken": token,
    }, SetOptions(merge: true));
  }
}
