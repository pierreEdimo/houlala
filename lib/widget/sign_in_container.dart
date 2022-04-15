import 'package:flutter/material.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:houlala/widget/email_input.dart';
import 'package:houlala/widget/password_input.dart';
import 'package:provider/provider.dart';
import '../helper/constants.dart';
import 'custom_elevated_button.dart';

class SignInContainer extends StatefulWidget {
  const SignInContainer({Key? key}) : super(key: key);

  @override
  State<SignInContainer> createState() => _SignInContainerState();
}

class _SignInContainerState extends State<SignInContainer> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController? _emailController = TextEditingController();
  final TextEditingController? _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: SizedBox(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                const Text(
                  "Bienvenu sur Houlala",
                  style: TextStyle(fontSize: 24.0),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                EmailInput(
                  controller: _emailController,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                PasswordInput(
                  controller: _passwordController!,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                CustomElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print(_passwordController!.text);
                      print(_emailController!.text);

                    }

                    Provider.of<AuthService>(context, listen: false).logIn();

                  },
                  child: Text(
                    "Se Connecter",
                    style: standardStyle,
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Row(
                  children: [
                    const Text(
                      "Nouveau sur houlala?",
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: () => print("hello World!"),
                      child: const Text(
                        "S'enregistrer",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Mot de passe oublier? / Problèmes de connexion",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
