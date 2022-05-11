import 'package:flutter/material.dart';
import 'package:houlala/widget/app_bar_with_return.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBarWithReturn(
        title: "Options",
        elevation: 1,
      ),
      body: const Text("Hello Options"),
    );
  }
}
