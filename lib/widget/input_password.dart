import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController? controller;

  final passWordRex =
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
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 15.0,
          ),
          labelText: "Mot De Passe",
          border: OutlineInputBorder()),
      validator: (value) {
        value = controller!.text;
        if (value.isEmpty) {
          return 'Inserer un Mot de passe';
        }
        if (!passWordRex.hasMatch(value)) {
          return 'Mot de passe invalide';
        }
        return null;
      },
    );
  }
}
