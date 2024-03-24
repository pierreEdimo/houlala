import 'package:flutter/material.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:houlala/shared_widgets/custom_elevated_button.dart';
import 'package:houlala/shared_widgets/personnal_data_container.dart';
import 'package:houlala/shared_widgets/standard_custom_container.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../helper/constants.dart';
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
      body: SingleChildScrollView(
        child: StandardCustomContainer(
            child: FutureBuilder(
          future: Provider.of<AuthService>(context).fetchConnectedUser(),
          builder:
              (BuildContext context, AsyncSnapshot<UserInformation> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.hasData) {
              UserInformation? connectedUser = snapshot.data;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey.shade300, width: 1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100.w,
                              margin: const EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Colors.grey.shade300),
                                ),
                              ),
                              child: const Text(
                                "Adresse Email",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "PoppinsBold"),
                              ),
                            ),
                            Text(
                              connectedUser!.email!,
                              style: TextStyle(
                                fontSize: customFontSize,
                              ),
                            ),
                            verticalSpacing,
                          ],
                        ),
                      ),
                    ),
                    CustomElevatedButton(
                      onPressed: () => navigateToEdit(connectedUser, context),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit_outlined),
                          Text(
                            "Modifier Mon Email",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "PoppinsBold",
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpacing,
                    PersonalDataContainer(
                      connectedUser: connectedUser,
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )),
      ),
    );
  }
}
