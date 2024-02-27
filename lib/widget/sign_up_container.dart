import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:houlala/model/register.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:houlala/widget/display_dialog.dart';
import 'package:houlala/widget/input_name.dart';
import 'package:houlala/widget/input_number.dart';
import 'package:houlala/widget/show_nack.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import '../helper/constants.dart';
import 'custom_elevated_button.dart';
import 'input_email.dart';
import 'input_password.dart';

class SignUpContainer extends StatefulWidget {
  const SignUpContainer({Key? key}) : super(key: key);

  @override
  State<SignUpContainer> createState() => _SignUpContainerState();
}

class _SignUpContainerState extends State<SignUpContainer> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _houseNbrController = TextEditingController();
  final TextEditingController _countryController =
      TextEditingController(text: 'Cameroun');
  final TextEditingController _cityController =
      TextEditingController(text: 'Yaounde');
  final TextEditingController _poBoxController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _numberController.dispose();
    _nameController.dispose();
    _userNameController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _poBoxController.dispose();
    _houseNbrController.dispose();
    _firstNameController.dispose();
    super.dispose();
  }

  /// Enregistre un utilisateur dans la base de donnee
  logup() async {
    if (_formKey.currentState!.validate()) {
      Register register = Register(
          email: _emailController.text,
          userName: _userNameController.text,
          name: _nameController.text,
          telephoneNumber: _numberController.text,
          password: _passwordController.text,
          poBox: _poBoxController.text,
          city: _cityController.text,
          country: _countryController.text,
          streetName: _streetController.text,
          houseNumber: _houseNbrController.text,
          firstName: _firstNameController.text);

      Response response = await Provider.of<AuthService>(context, listen: false)
          .register(register);

      if (response.statusCode != HttpStatus.created) {
        final responseJson = json.decode(response.body);
        showErrorDialog(context, "Erreur", responseJson['message']);
      } else {
        Navigator.of(context).pop();
        showSnack(const Text("felicitations, Vous etes connecte sur houlala."),
            context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
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
            const SizedBox(
              height: 20.0,
            ),
            PasswordInput(
              controller: _passwordController,
            ),
            standardSizedBox,
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    enabled: false,
                    initialValue: "+237",
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                horizontalSpacing,
                Expanded(
                  flex: 4,
                  child: InputNumber(
                    controller: _numberController,
                    hintText: 'Numero de telephone',
                    errorMessage: 'Inserez votre Numero de telephone',
                  ),
                )
              ],
            ),
            standardSizedBox,
            NameInput(
              hintText: 'Nom',
              controller: _nameController,
              errorMessage: 'Inserez votre Nom',
            ),
            standardSizedBox,
            NameInput(
              hintText: 'Prenom',
              controller: _firstNameController,
              errorMessage: "Inserez votre Prenom",
            ),
            standardSizedBox,
            NameInput(
              hintText: 'surnom',
              controller: _userNameController,
              errorMessage: 'Inserez votre Surnom',
            ),
            standardSizedBox,
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: NameInput(
                    hintText: 'Rue',
                    errorMessage: 'Inserez votre rue',
                    controller: _streetController,
                  ),
                ),
                horizontalSpacing,
                Expanded(
                  child: TextFormField(
                    controller: _houseNbrController,
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
            NameInput(
              enabled: false,
              errorMessage: "Inserez votre pays d'habitation",
              hintText: "Pays",
              controller: _countryController,
            ),
            standardSizedBox,
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: NameInput(
                    enabled: false,
                    errorMessage: "Inserez votre ville d'habitation",
                    hintText: "Ville",
                    controller: _cityController,
                  ),
                ),
                horizontalSpacing,
                Expanded(
                  child: TextFormField(
                    controller: _poBoxController,
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
            CustomElevatedButton(
              hasBorder: false,
              color: Colors.orangeAccent,
              onPressed: () async => logup(),
              child: Text(
                "Creer un Compte",
                style: standardStyle,
              ),
            ),
            standardSizedBox
          ],
        ),
      ),
    );
  }
}
