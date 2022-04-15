import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController? controller;

  final  passWordRex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!?@#\$&*~]).{6,}$');

  PasswordInput({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: const InputDecoration(hintText: "Mot De Passe"),
      validator: (value) {
        value = controller!.text;
        if (value.isEmpty) {
          return 'password is required';
        }
        if (!passWordRex.hasMatch(value)) {
          return 'invalid password';
        }
        return null;
      },
    );
  }
}
