import 'package:flutter/material.dart';
import 'package:houlala/model/address.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../service/auth_service.dart';

class AddressContainer extends StatelessWidget {

  const AddressContainer({
    Key? key,
  }) : super(key: key);

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
      child: Consumer<AuthService>(
        builder: (context, authService, child) {
          Address address = authService.getAddress();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(address.streetName!),
              Text(address.city! + ", " + address.country!)
            ],
          );
        },
      ),
    );
  }
}
