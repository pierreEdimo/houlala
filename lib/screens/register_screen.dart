import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/controllers/auth_controller.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/models/register/register_model.dart';
import 'package:houlala/shared_widgets/custom_button_container.dart';
import 'package:houlala/shared_widgets/custom_elevated_button.dart';
import 'package:houlala/shared_widgets/input_email.dart';
import 'package:houlala/shared_widgets/input_name.dart';
import 'package:houlala/shared_widgets/input_number.dart';
import 'package:houlala/shared_widgets/input_password.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController houseNbrController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController poBoxController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

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
        title: const Text('Creer un compte'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Image.asset(
                    'images/houlala.png',
                    height: 180,
                  ),
                ),
                standardSizedBox,
                EmailInput(controller: emailController),
                standardSizedBox,
                PasswordInput(controller: passwordController),
                standardSizedBox,
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        enabled: false,
                        initialValue: "+237",
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    horizontalSpacing,
                    Expanded(
                      flex: 4,
                      child: InputNumber(
                        controller: numberController,
                        hintText: 'Numero de telephone',
                        errorMessage: 'Inserez votre Numero de telephone',
                      ),
                    )
                  ],
                ),
                standardSizedBox,
                NameInput(
                  hintText: 'Nom de famille',
                  enabled: true,
                  errorMessage: 'Inserez votre Nom de famille',
                  controller: lastNameController,
                ),
                standardSizedBox,
                NameInput(
                  hintText: 'Prenom',
                  enabled: true,
                  errorMessage: 'Inserez votre Nom de famille',
                  controller: firstNameController,
                ),
                standardSizedBox,
                NameInput(
                  hintText: 'Votre Pays',
                  enabled: true,
                  errorMessage: 'Inserez votre Pays',
                  controller: countryController,
                ),
                standardSizedBox,
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: NameInput(
                        enabled: true,
                        errorMessage: "Inserez votre ville d'habitation",
                        hintText: "Ville",
                        controller: cityController,
                      ),
                    ),
                    horizontalSpacing,
                    Expanded(
                      child: TextFormField(
                        controller: poBoxController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 15.0,
                          ),
                          border: OutlineInputBorder(),
                          labelText: "B.P",
                        ),
                      ),
                    )
                  ],
                ),
                standardSizedBox,
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: NameInput(
                        hintText: 'Rue',
                        errorMessage: 'Inserez votre rue',
                        controller: streetController,
                      ),
                    ),
                    horizontalSpacing,
                    Expanded(
                      child: TextFormField(
                        controller: houseNbrController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 15.0,
                            ),
                            labelText: 'N.r',
                            border: OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
                standardSizedBox,
                CustomElevatedButton(
                  onPressed: () {
                    Random random = Random();

                    if (_formKey.currentState!.validate()) {
                      int randomNumber = random.nextInt(200) + 100;

                      String userName =
                          '${firstNameController.text}.${lastNameController.text}$randomNumber';
                      String trimmedUserName = userName.trim();
                      RegisterModel registerModel = RegisterModel(
                        email: emailController.text,
                        passWord: passwordController.text,
                        phoneNumber: numberController.text,
                        lastName: lastNameController.text,
                        firstName: firstNameController.text,
                        streetName: streetController.text,
                        userName: trimmedUserName.toLowerCase(),
                        houseNumber: houseNbrController.text,
                        city: cityController.text,
                        country: countryController.text,
                        poBox: poBoxController.text,
                      );
                      authController.registerUser(registerModel);
                      authController.reloadUser();
                      Navigator.of(context).pushReplacementNamed('/');
                    }
                  },
                  hasBorder: false,
                  color: Colors.orangeAccent,
                  child: Text(
                    "Creer un compte",
                    style: standardStyle,
                  ),
                ),
                Row(
                  children: [
                    const Text(' Vous avez un compte?'),
                    TextButton(
                      onPressed: () =>
                          Navigator.of(context).pushReplacementNamed('/login'),
                      child: const Text('Se Connecter'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
