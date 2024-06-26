import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController? controller;

  final passWordRex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!?@#\$&*~]).{6,}$');

  PasswordInput({
    super.key,
    this.controller,
  });

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
          labelText: "Mot de passe",
          border: OutlineInputBorder()),
      validator: (value) {
        value = controller!.text;
        if (value.isEmpty) {
          return 'Inserer un Mot de passe';
        }
        if (value.length < 7) {
          return 'votre mot de passe doit avoir minimum 7 caracteres';
        }
        if (!passWordRex.hasMatch(value)) {
          return 'mot de passe invalide';
        }
        return null;
      },
    );
  }
}
