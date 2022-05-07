import 'package:flutter/material.dart';
import 'package:houlala/model/personal_datas.dart';
import 'package:sizer/sizer.dart';

class PersonalDataContainer extends StatelessWidget {
  final PersonalData? connectedUser;
  const PersonalDataContainer({Key? key,this.connectedUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 5.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.grey.shade200,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(connectedUser!.lastName! +
              " " +
              connectedUser!.firstName!),
          Text(connectedUser!.email!),
          Text(connectedUser!.telephoneNumber!),
        ],
      ),
    );
  }
}
