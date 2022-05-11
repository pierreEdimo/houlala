import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/model/cart_item.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:houlala/widget/online_personal_data_container.dart';
import 'package:houlala/widget/custom_elevated_button.dart';
import 'package:houlala/widget/personnal_data_container.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../model/count_and_price.dart';

class CheckoutButton extends StatelessWidget {
  final List<CartItem>? items;
  final CountAndPrice? total;

  const CheckoutButton({
    Key? key,
    this.total,
    this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loggedState = Provider.of<AuthService>(context).getLoggedState();
    return CustomElevatedButton(
      child: Text(
        "Caisse (${total!.totalQuantity!.toString()})",
        style: standardStyle,
      ),
      onPressed: () async {
        showMaterialModalBottomSheet(
          expand: true,
          context: context,
          builder: (BuildContext context) {
            switch (loggedState) {
              case 'loggedIn':
                return OnlinePersonalDataContainer(
                  items: items!,
                  total: total!,
                );
              case null:
              default:
                return PersonalDataContainer(
                  items: items!,
                  total: total!,
                );
            }
          },
        );
      },
    );
  }
}
