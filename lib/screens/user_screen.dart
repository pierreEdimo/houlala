import 'package:flutter/material.dart';
import 'package:houlala/widget/standard_app_bar.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: StandardAppBar(
        title: "Mon Compte",
      ),
      body: const  Center(
        child: Text("Hello User"),
      ),
    );
  }
}
