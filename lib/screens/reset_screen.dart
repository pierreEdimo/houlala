import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/model/login.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/display_dialog.dart';
import 'package:houlala/widget/show_nack.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../widget/custom_elevated_button.dart';
import '../widget/input_email.dart';
import '../widget/input_password.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// Reenitialise le Mot de passe de l'utilisateur
  reset(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      Login login = Login(
          email: _emailController.text, password: _passwordController.text);

      Response response = await Provider.of<AuthService>(context, listen: false)
          .resetPassword(login);

      if (response.statusCode != 200) {
        showErrorDialog(
            context,
            "Erreur",
            "Erreur lors de la requete. svp"
                "reesayez plutard. Si le probleme persiste, contactez notre service client.");
      } else {
        Navigator.of(context).pop();

        showSnack(const Text("Votre message a ete reenitialise avec succes"),
            context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithReturn(
        elevation: 1,
        title: "Nouveau mot de passe",
        color: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 180,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Form(
              key: _formkey,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Probleme ? mettez votre addresse E-mail "
                      "et votre nouveau mot de passe.",
                      textAlign: TextAlign.center,
                    ),
                    standardSizedBox,
                    EmailInput(
                      controller: _emailController,
                    ),
                    standardSizedBox,
                    PasswordInput(
                      controller: _passwordController,
                    ),
                    standardSizedBox,
                    CustomElevatedButton(
                      hasBorder: false,
                      color: Colors.orangeAccent,
                      onPressed: () async => reset(context),
                      child: Text(
                        "Reenitialisez votre Mot de passe ",
                        style: standardStyle,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
