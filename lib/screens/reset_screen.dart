import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/shared_widgets/custom_button_container.dart';
import '../shared_widgets/custom_elevated_button.dart';
import '../shared_widgets/input_email.dart';
import '../shared_widgets/input_password.dart';

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
  reset(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        automaticallyImplyLeading: false,
        leading: CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.angleLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Reinitialisez votre mot de passe'),
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
