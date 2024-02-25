import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/widget/container_wirth_connectivity_checker.dart';
import 'package:houlala/widget/custom_avatar.dart';

import '../widget/custom_button_container.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
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
