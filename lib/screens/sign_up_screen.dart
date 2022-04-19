import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:houlala/model/register.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/display_dialog.dart';
import 'package:houlala/widget/input_name.dart';
import 'package:houlala/widget/input_number.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import '../helper/constants.dart';
import '../widget/custom_elevated_button.dart';
import '../widget/input_email.dart';
import '../widget/input_password.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController? _emailController = TextEditingController();
  final TextEditingController? _passwordController = TextEditingController();
  final TextEditingController? _numberController = TextEditingController();
  final TextEditingController? _nameController = TextEditingController();
  final TextEditingController? _firstNameController = TextEditingController();
  final TextEditingController? _streetController = TextEditingController();
  final TextEditingController? _houseNbrController = TextEditingController();
  final TextEditingController? _countryController =
      TextEditingController(text: 'Cameroun');
  final TextEditingController? _cityController =
      TextEditingController(text: 'Yaounde');
  final TextEditingController? _poBoxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithReturn(
        elevation: 1,
        title: "houlala",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 30.0,
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
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        enabled: false,
                        initialValue: "+237",
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      flex: 6,
                      child: InputNumber(
                        controller: _numberController,
                        hintText: 'Numero de telephone',
                        errorMessage: 'Inserez votre Numero de telephone',
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                NameInput(
                  hintText: 'Nom',
                  controller: _nameController,
                  errorMessage: 'Inserez votre Nom',
                ),
                const SizedBox(
                  height: 20.0,
                ),
                NameInput(
                  hintText: 'Prenom',
                  controller: _firstNameController,
                  errorMessage: 'Inserez votre Prenom',
                ),
                const SizedBox(
                  height: 20.0,
                ),
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
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _houseNbrController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(hintText: 'N.r'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                NameInput(
                  enabled: false,
                  errorMessage: "Inserez votre pays d'habitation",
                  hintText: "Pays",
                  controller: _countryController,
                ),
                const SizedBox(
                  height: 20.0,
                ),
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
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _poBoxController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "B.P",
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                CustomElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Address address = Address(
                          poBox: _poBoxController!.text,
                          city: _cityController!.text,
                          country: _countryController!.text,
                          streetName: _streetController!.text);

                      Register register = Register(
                          email: _emailController!.text,
                          firstName: _firstNameController!.text,
                          lastName: _nameController!.text,
                          telephoneNumber: _numberController!.text,
                          password: _passwordController!.text,
                          address: address);

                      Response response =
                          await Provider.of<AuthService>(context, listen: false)
                              .register(register);

                      if (response.statusCode != 201) {
                        final responseJson = json.decode(response.body);
                        showErrorDialog(
                            context, "Erreur", responseJson['message']);
                      } else {
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  child: Text(
                    "Creer un Compte",
                    style: standardStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
