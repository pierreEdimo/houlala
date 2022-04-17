import 'package:flutter/material.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:houlala/widget/sign_in_container.dart';
import 'package:houlala/widget/standard_app_bar.dart';
import 'package:provider/provider.dart';

import '../widget/user_screen_container.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? logInState =
        Provider.of<AuthService>(context).getLoggedState();

    return Scaffold(
      appBar: StandardAppBar(
        title: "houlala",
      ),
      body: logInState != 'loggedIn'
          ? const SignInContainer()
          : const UserScreenContainer(),
    );
  }
}
