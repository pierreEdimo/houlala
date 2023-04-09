import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/model/address.dart';
import 'package:houlala/model/edit_email.dart';
import 'package:houlala/model/edit_screen_arguments.dart';
import 'package:houlala/model/personal_data.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/custom_elevated_button.dart';
import 'package:houlala/widget/input_email.dart';
import 'package:houlala/widget/input_name.dart';
import 'package:houlala/widget/show_nack.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController? _emailController = TextEditingController();
  final TextEditingController? _passwordController = TextEditingController();
  final TextEditingController? _numberController = TextEditingController();
  final TextEditingController? _nameController = TextEditingController();
  final TextEditingController? _userNameController = TextEditingController();
  final TextEditingController? _streetController = TextEditingController();
  final TextEditingController? _houseNbrController = TextEditingController();
  final TextEditingController? _countryController =
      TextEditingController(text: 'Cameroun');
  final TextEditingController? _cityController =
      TextEditingController(text: 'Yaounde');
  final TextEditingController? _poBoxController = TextEditingController();
  final TextEditingController? _firstNameController = TextEditingController();

  @override
  void dispose() {
    _emailController!.dispose();
    _passwordController!.dispose();
    _numberController!.dispose();
    _nameController!.dispose();
    _userNameController!.dispose();
    _streetController!.dispose();
    _cityController!.dispose();
    _countryController!.dispose();
    _poBoxController!.dispose();
    _houseNbrController!.dispose();
    _firstNameController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final EditScreenArguments? editScreenArguments =
        ModalRoute.of(context)!.settings.arguments as EditScreenArguments;

    _emailController!.text = editScreenArguments!.email!;
    _userNameController!.text = editScreenArguments.userName!;
    _nameController!.text = editScreenArguments.name!;
    _numberController!.text = editScreenArguments.telephoneNumber!;
    _houseNbrController!.text = editScreenArguments.houseNumber!;
    _poBoxController!.text = editScreenArguments.poBox!;
    _houseNbrController!.text = editScreenArguments.houseNumber!;
    _streetController!.text = editScreenArguments.streetName!;
    _cityController!.text = editScreenArguments.city!;
    _countryController!.text = editScreenArguments.country!;
    _firstNameController!.text = editScreenArguments.firstName!;

    /// modifie l'E-mail de l'utilisateur
    editEmail() async {
      EditEmail model = EditEmail(email: _emailController!.text);

      Response response = await Provider.of<AuthService>(context, listen: false)
          .editEmail(model);

      if (response.statusCode == 200) {
        showSnack(
            const Text("votre adresse a ete mise a jour avec succes"), context);
        Navigator.of(context).pop();
      }
    }

    /// modifie l'adresse de l'utilisateur
    editAddress() async {
      Address address = Address(
        country: _countryController!.text,
        city: _cityController!.text,
        poBox: _poBoxController!.text,
        streetName: _streetController!.text,
        houseNumber: _houseNbrController!.text,
      );

      Response? response =
          await Provider.of<AuthService>(context, listen: false)
              .editAddressData(address);

      if (response.statusCode == 200) {
        showSnack(
            const Text("votre adresse a ete mise a jour avec succes"), context);
        Navigator.of(context).pop();
      }
    }

    /// modifie les informations personnelles
    editProfile() async {
      PersonalData data = PersonalData(
        name: _nameController!.text,
        userName: _userNameController!.text,
        phoneNumber: _numberController!.text,
        firstName: _firstNameController!.text,
      );

      Response? response =
          await Provider.of<AuthService>(context, listen: false)
              .editPersonalData(data);

      if (response.statusCode == 200) {
        showSnack(
            const Text("votre profile a ete mise a jour avec succes"), context);
        Navigator.of(context).pop();
      }
    }

    switch (editScreenArguments.type!) {
      case 'email':
        return Scaffold(
          appBar: AppBarWithReturn(
            title: "Modifier",
            elevation: 1,
          ),
          body: Column(
            children: [
              StandardCustomContainer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Form(
                    key: _formKey,
                    child: EmailInput(
                      controller: _emailController,
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11.0),
            child: SizedBox(
              width: 100.w,
              child: CustomElevatedButton(
                onPressed: () async => editEmail(),
                child: const Text(
                  "Enregistrer",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      case 'address':
        return Scaffold(
          appBar: AppBarWithReturn(
            title: "Modifier",
            elevation: 1,
          ),
          body: Column(
            children: [
              StandardCustomContainer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        NameInput(
                          hintText: "Rue",
                          controller: _streetController,
                          errorMessage: 'Inserez votre rue',
                        ),
                        standardSizedBox,
                        NameInput(
                          hintText: 'Nr de Domicile',
                          controller: _houseNbrController,
                          errorMessage: 'Inserez votre Numero de Domicile',
                        ),
                        standardSizedBox,
                        NameInput(
                          hintText: 'Boite Postale',
                          controller: _poBoxController,
                          errorMessage: 'Inserez votre Boite Postale',
                        ),
                        standardSizedBox,
                        NameInput(
                          controller: _cityController,
                          hintText: 'Ville',
                          errorMessage: 'Inserez votre Ville',
                        ),
                        standardSizedBox,
                        NameInput(
                          controller: _countryController,
                          hintText: 'Pays',
                          errorMessage: 'Inserez votre Pays',
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11.0),
            child: SizedBox(
              width: 100.w,
              child: CustomElevatedButton(
                onPressed: () async => editAddress(),
                child: const Text(
                  "Enregistrer",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      case 'personal':
      default:
        return Scaffold(
          appBar: AppBarWithReturn(
            title: "Modifier",
            elevation: 1,
          ),
          body: Column(
            children: [
              StandardCustomContainer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        NameInput(
                          hintText: 'Surnom',
                          controller: _userNameController,
                          errorMessage: 'Inserez votre Surnom',
                        ),
                        standardSizedBox,
                        NameInput(
                          controller: _nameController,
                          hintText: 'Nom',
                          errorMessage: 'Inserez votre Nom',
                        ),
                        standardSizedBox,
                        NameInput(
                          controller: _firstNameController,
                          hintText: 'Prenom',
                          errorMessage: 'Insererz votre Prenom',
                        ),
                        standardSizedBox,
                        NameInput(
                          controller: _numberController,
                          hintText: 'Numero de telephone',
                          errorMessage: 'Inserez votre numero',
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11.0),
            child: SizedBox(
              width: 100.w,
              child: CustomElevatedButton(
                onPressed: () async => editProfile(),
                child: const Text(
                  "Enregistrer",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
    }
  }
}
