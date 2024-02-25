import 'package:flutter/material.dart';
import 'package:houlala/widget/container_wirth_connectivity_checker.dart';
import '../widget/user_screen_container.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: const CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 35,
          backgroundImage: AssetImage('images/houlala1.png'),
        ),
        title: const Text("Mon profile"),
      ),
      body: const ContainerWithConnectivityChecker(
        child: UserScreenContainer(),
      ),
    );
  }
}
