import 'package:flutter/material.dart';
import 'package:houlala/widget/standard_custom_container.dart';

class CheckoutBar extends StatelessWidget {
  const CheckoutBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      child: Material(
        elevation: 1,
        child: Container(
          color: const Color(0xf2f2f2f2),
          child: const StandardCustomContainer(
            child: SafeArea(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Terminer votre Commande",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PoppinsBold'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
