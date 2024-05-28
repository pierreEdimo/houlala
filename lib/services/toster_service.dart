import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToasterService {
  static void openToasterOnSuccess(String message) {
    _openToaster(message, ToastificationType.success, Colors.lightGreen);
  }

  static void openToasterOnFailure(String message) {
    _openToaster(message, ToastificationType.error, Colors.red);
  }

  static void _openToaster(
      String message, ToastificationType type, Color backgroundColor) {
    toastification.show(
        title: Text(message),
        type: type,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 5),
        backgroundColor: backgroundColor,
        borderRadius: BorderRadius.circular(5.0),
        alignment: Alignment.bottomCenter,
        foregroundColor: Colors.white);
  }
}
