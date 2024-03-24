import 'package:flutter/material.dart';

import '../model/edit_screen_arguments.dart';
import '../model/user_information.dart';

class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({Key? key}) : super(key: key);

  /// Navigate vers l'Edit
  navigateToEdit(UserInformation connectedUser, BuildContext context) {
    EditScreenArguments args = EditScreenArguments(
        email: connectedUser.email!,
        country: connectedUser.country,
        city: connectedUser.city,
        userName: connectedUser.userName,
        poBox: connectedUser.poBox,
        streetName: connectedUser.streetName,
        telephoneNumber: connectedUser.telephoneNumber,
        name: connectedUser.name,
        houseNumber: connectedUser.houseNumber,
        type: "email");

    Navigator.of(context).pushNamed("/edit", arguments: args);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container()
      ); 
  }
}
