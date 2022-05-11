import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/model/personal_datas.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:houlala/widget/address_container.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/personal_data_container.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:provider/provider.dart';

class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithReturn(
        title: "Mes Donnees personnelles",
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: StandardCustomContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Donnees Personnelles",
                style: standardStyle,
              ),
              verticalSpacing,
              Consumer<AuthService>(
                builder: (BuildContext context, authService, child) {
                  PersonalData user = authService.getUserData();
                  return PersonalDataContainer(
                    connectedUser: user,
                  );
                },
              ),
              standardSizedBox,
              Text(
                "Adresse",
                style: standardStyle,
              ),
              verticalSpacing,
              const AddressContainer()
            ],
          ),
        ),
      ),
    );
  }
}
