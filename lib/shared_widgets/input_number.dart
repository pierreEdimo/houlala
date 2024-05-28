import 'package:flutter/material.dart';

class InputNumber extends StatelessWidget {
  final TextEditingController? controller;
  final String? errorMessage;
  final String? hintText;

  const InputNumber({
    super.key,
    this.controller,
    this.errorMessage,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 15.0,
          ),
          labelText: hintText,
          border: const OutlineInputBorder()),
      validator: (value) {
        value = controller!.text;
        if (value.isEmpty) {
          return errorMessage;
        }
        return null;
      },
    );
  }
}
