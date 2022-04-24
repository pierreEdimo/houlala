import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/widget/custom_elevated_button.dart';
import '../model/CountAndPrice.dart';

class CheckoutButton extends StatelessWidget {
  //final List<CartItem>? items;
  final CountAndPrice? total;

  const CheckoutButton({
    Key? key,
    this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return CustomElevatedButton(
      child: Text(
        "Caisse (${total!.totalQuantity.toString()})",
        style: standardStyle,
      ),
      onPressed: () => print("suivant"),
    );
  }
}
