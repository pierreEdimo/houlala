import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/controllers/auth_controller.dart';
import 'package:houlala/widget/custom_button_container.dart';
import 'package:houlala/widget/input_email.dart';
import 'package:houlala/widget/input_password.dart';
import '../helper/constants.dart';
import '../widget/custom_elevated_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController(ref);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.angleLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Se connecter'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Image.asset(
                    'images/houlala.png',
                    height: 180,
                  ),
                ),
                const SizedBox(height: 20.0),
                EmailInput(
                  controller: emailController,
                ),
                const SizedBox(height: 10.0),
                PasswordInput(
                  controller: passwordController,
                ),
                const SizedBox(height: 20.0),
                InkWell(
                  onTap: () => Navigator.of(context).popAndPushNamed("/reset"),
                  child: const Text(
                    "Mot de Passe oublie? / Probleme de connexion?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      authController.login(
                          emailController.text, passwordController.text);
                      authController.reloadUser();
                      Navigator.of(context).pushReplacementNamed('/');
                    }
                  },
                  hasBorder: false,
                  color: Colors.orangeAccent,
                  child: Text(
                    "Se Connecter",
                    style: standardStyle,
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
