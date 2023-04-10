import 'package:flutter/material.dart';
import 'package:houlala/model/edit_screen_arguments.dart';
import 'package:houlala/model/user_information.dart';
import 'package:houlala/widget/custom_elevated_button.dart';
import 'package:sizer/sizer.dart';

import '../helper/constants.dart';

class PersonnalDataContainer extends StatelessWidget {
  final UserInformation? connectedUser;

  const PersonnalDataContainer({
    Key? key,
    this.connectedUser,
  }) : super(key: key);

  navigateToEdit(BuildContext context, String type) {
    EditScreenArguments args = EditScreenArguments(
        email: connectedUser!.email!,
        country: connectedUser!.country,
        city: connectedUser!.city,
        userName: connectedUser!.userName,
        poBox: connectedUser!.poBox,
        streetName: connectedUser!.streetName,
        telephoneNumber: connectedUser!.telephoneNumber,
        name: connectedUser!.name,
        houseNumber: connectedUser!.houseNumber,
        firstName: connectedUser!.firstName,
        type: type);

    Navigator.of(context).pushNamed("/edit", arguments: args);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey.shade200, width: 1),
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
                  child: Text(
                    "Informations Personnelles",
                    style: titleStyle,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Colors.grey.shade300),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      connectedUser!.userName!,
                      style: TextStyle(
                        fontSize: customFontSize,
                      ),
                    ),
                    Text(
                      '${connectedUser!.name!} ${connectedUser!.firstName}',
                      style: TextStyle(fontSize: customFontSize),
                    ),
                    connectedUser!.telephoneNumber != null
                        ? Text(
                            "+237 ${connectedUser!.telephoneNumber!}",
                            style: TextStyle(fontSize: customFontSize),
                          )
                        : Container()
                  ],
                )
              ],
            ),
          ),
        ),
        verticalSpacing,
        CustomElevatedButton(
          onPressed: () => navigateToEdit(context, "personal"),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.edit_outlined),
              Text(
                "Modifier Mes informations",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: "PoppinsBold"),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Card(
          color: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey.shade300, width: 1),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.w,
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: const Text(
                    "Adresse de livraison",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "PoppinsBold"),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Colors.grey.shade300),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${connectedUser!.streetName!} ',
                          style: TextStyle(
                            fontSize: customFontSize,
                          ),
                        ),
                        connectedUser!.houseNumber != null
                            ? Text(
                                connectedUser!.houseNumber!,
                                style: TextStyle(
                                  fontSize: customFontSize,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    Row(
                      children: [
                        connectedUser!.poBox != null
                            ? Text(
                                "${connectedUser!.poBox!}, ",
                                style: TextStyle(
                                  fontSize: customFontSize,
                                ),
                              )
                            : Container(),
                        Text(
                          connectedUser!.city!,
                          style: TextStyle(
                            fontSize: customFontSize,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      connectedUser!.country!,
                      style: TextStyle(
                        fontSize: customFontSize,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        verticalSpacing,
        CustomElevatedButton(
          onPressed: () => navigateToEdit(context, "address"),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.edit_outlined),
              Text(
                "Modifier Mon Addresse",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: "PoppinsBold"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
