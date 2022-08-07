import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:houlala/model/login.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:houlala/widget/display_dialog.dart';
import 'package:houlala/widget/input_email.dart';
import 'package:houlala/widget/input_password.dart';
import 'package:houlala/widget/show_nack.dart';
import 'package:http/http.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
  void dispose() {
    _emailController!.dispose();
    _passwordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 30.0,
              ),
              EmailInput(
                controller: _emailController,
              ),
              standardSizedBox,
              PasswordInput(
                controller: _passwordController!,
              ),
              const SizedBox(
                height: 40.0,
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  "Mot de Passe oublie? / Probleme de connexion?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
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

                    if (response.statusCode != 202) {
                      final responseJson = json.decode(response.body);
                      showErrorDialog(context, "Erreur",
                          "${responseJson['message']}, svp reessayez plutard, si le probleme persiste, contectez nous");
                    } else {
                      Navigator.of(context).pop();
                      showSnack(
                          const Text(
                              "felicitations, vous etes connecte sur houlala."),
                          context);
                    }
                  }
                },
                child: Text(
                  "Se Connecter",
                  style: standardStyle,
                ),
              ),
              standardSizedBox
            ],
          ),
        ),
      ),
    );
  }
}
