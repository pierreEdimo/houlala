import 'package:flutter/material.dart';

showSnack(Widget? content, BuildContext context, {int? second}) {
  final snackBar = SnackBar(
    duration:Duration(seconds: second ?? 1),
    content: content!,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
