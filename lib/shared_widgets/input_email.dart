import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController? controller;

  const EmailInput({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 15.0,
          ),
          labelText: "Email",
          border: OutlineInputBorder()),
      validator: (value) {
        value = controller!.text;
        if (value.isEmpty) {
          return 'Inserer une adresse E-mail';
        } else if (!value.contains('@')) {
          return 'Svp entrer une E-mail valide';
        }
        return null;
      },
    );
  }
}
