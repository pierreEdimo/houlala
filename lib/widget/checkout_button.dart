import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/widget/custom_elevated_button.dart';

class CheckoutButton extends StatelessWidget {
  final int? totalQuantity;

  const CheckoutButton({
    Key? key,
    this.totalQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return CustomElevatedButton(
      child: Text(
        "Caisse (${totalQuantity.toString()})",
        style: standardStyle,
      ),
      onPressed: () => print("suivant"),
    );
  }
}
