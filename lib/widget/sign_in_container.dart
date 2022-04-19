import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:houlala/model/login.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:houlala/widget/display_dialog.dart';
import 'package:houlala/widget/input_email.dart';
import 'package:houlala/widget/input_password.dart';
import 'package:http/http.dart';
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
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PoppinsBold'),
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
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Login login = Login(
                        email: _emailController!.text,
                        password: _passwordController!.text);

                    Response response =
                        await Provider.of<AuthService>(context, listen: false)
                            .logIn(login);

                    if (response.statusCode != 201) {
                      final responseJson = json.decode(response.body);
                      showErrorDialog(context, "Erreur",
                          "${responseJson['message']}, svp reessayez plutard, si le probleme persiste, contectez nous");
                    }
                  }
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
                    onTap: () => Navigator.of(context).pushNamed("/signUp"),
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
    );
  }
}
