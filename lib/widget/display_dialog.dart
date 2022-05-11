import 'package:flutter/material.dart';

Future<void> showErrorDialog(
    context,
    String title,
    String msg,
    ) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  msg,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text("ok"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      });
}