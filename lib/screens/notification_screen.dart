import 'package:flutter/material.dart';
import 'package:houlala/widget/container_wirth_connectivity_checker.dart';
import 'package:houlala/widget/standard_custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Notifications",
      ),
      body: ContainerWithConnectivityChecker(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ImageIcon(
                AssetImage("images/no-notification.png"),
                size: 140,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text("Il n'y'a aucunes notifications")
            ],
          ),
        ),
      ),
    );
  }
}
