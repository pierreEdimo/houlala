import 'package:flutter/material.dart';
import 'package:houlala/widget/app_bar_with_return.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWithReturn(
        title: "Options",
        elevation: 1,
        color: Colors.transparent,
      ),
      body: Text("Hello Options"),
    );
  }
}
