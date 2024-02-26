import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CustomBodyContainer extends StatelessWidget {
  final Widget? child;
  final bool? error;
  final String? errorMessage;
  final bool? loading;
  final double? loadingHeight;

  const CustomBodyContainer({
    super.key,
    this.child,
    this.error,
    this.errorMessage,
    @Default(false) this.loading,
    this.loadingHeight
  });

  @override
  Widget build(BuildContext context) {
    if (loading != null && loading == true) {
      return  Material(
        elevation: 3,
        color: Colors.white,
        child:  SizedBox(
          height: loadingHeight,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    if (error != null && error == true) {
      return Text(errorMessage!);
    }

    return child!;
  }
}
