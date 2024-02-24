import 'package:flutter/material.dart';
import 'package:houlala/widget/container_wirth_connectivity_checker.dart';
import 'package:houlala/widget/standard_app_bar.dart';

import '../widget/user_screen_container.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: StandardAppBar(
        title: "houlala",
      ),
      body: ContainerWithConnectivityChecker(
        child: UserScreenContainer(),
      ),
    );
  }
}
