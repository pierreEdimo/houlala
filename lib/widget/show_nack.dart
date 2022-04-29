import 'package:flutter/material.dart';

showSnack(Widget? content, BuildContext context) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 1),
    content: content!,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
