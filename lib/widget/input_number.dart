import 'package:flutter/material.dart';

class InputNumber extends StatelessWidget {
  final TextEditingController? controller;
  final String? errorMessage;
  final String? hintText;

  const InputNumber({
    Key? key,
    this.controller,
    this.errorMessage,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: hintText,
        border: const OutlineInputBorder()
      ),
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
