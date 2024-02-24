import 'package:flutter/material.dart';
import 'package:houlala/widget/container_wirth_connectivity_checker.dart';
import 'package:houlala/widget/custom_avatar.dart';
import 'package:houlala/widget/standard_custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: "Notifications",
      ),
      body: ContainerWithConnectivityChecker(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomAvatar(
                radius: 50,
                localAsset: "images/sound-off.png",
              ),
              SizedBox(
                height: 10.0,
              ),
              Text("Il n'y'a aucunes notifications")
            ],
          ),
        ),
      ),
    );
  }
}
