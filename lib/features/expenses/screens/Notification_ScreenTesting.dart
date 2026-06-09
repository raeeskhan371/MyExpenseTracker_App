import 'package:expense_tracker_app/core/widgets/custome_ElevetedButton.dart';
import 'package:expense_tracker_app/features/expenses/services/notification_services.dart';
import 'package:flutter/material.dart';

class NotificationScreentesting extends StatefulWidget {
  const NotificationScreentesting({super.key});

  @override
  State<NotificationScreentesting> createState() =>
      _NotificationScreentestingState();
}

class _NotificationScreentestingState extends State<NotificationScreentesting> {
  final String title = "Raees Khan";
  final String body = "Raees Khan is Flutter Developer";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppElevatedButton(
          ButtonText: "ShowNotification",
          width: 300,
          height: 60,
          ContainerColor: Colors.indigo,
          borderRadius: 10,
          TextColor: Colors.white,
          fontSize: 20,
          onPressed: () {
            NotificationServices.showNotification(title: title, body: body);
          },
        ),
      ),
    );
  }
}
