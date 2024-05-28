import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/shared_widgets/container_wirth_connectivity_checker.dart';
import 'package:houlala/shared_widgets/custom_avatar.dart';

import '../shared_widgets/custom_button_container.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 3,
        leading: const CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 35,
          backgroundImage: AssetImage('images/houlala1.png'),
        ),
        title: const Text("Notifications"),
        actions: [
          CustomButtonContainer(
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
            onPressed: () => Navigator.of(context).pushNamed("/search"),
          )
        ],
      ),
      body: const ContainerWithConnectivityChecker(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomAvatar(
                radius: 50,
                localAsset: "images/sound-off.png",
              ),
              standardSizedBox,
              Text("Il n'y'a aucunes notifications")
            ],
          ),
        ),
      ),
    );
  }
}
