import 'package:flutter/material.dart';
import 'package:houlala/widget/standard_custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Notifications",
      ),
      body: const Center(
        child: Text("Hello Notification"),
      ),
    );
  }
}
