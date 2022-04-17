import 'package:flutter/material.dart';

class NameInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? errorMessage;
  final String? hintText;
  final bool? enabled;

  const NameInput({
    Key? key,
    this.controller,
    this.errorMessage,
    this.hintText,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled ?? true,
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: hintText!,
      ),
      validator: (value) {
        value = controller!.text;
        if (value.isEmpty) {
          return errorMessage!;
        }
        return null;
      },
    );
  }
}
