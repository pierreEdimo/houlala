import 'package:flutter/material.dart';
import 'package:houlala/widget/container_wirth_connectivity_checker.dart';
import 'package:houlala/widget/list_of_cart_items.dart';
import 'package:houlala/widget/standard_custom_app_bar.dart';

class CartItemScreen extends StatelessWidget {
  const CartItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Mon Panier",
      ),
      body: const ContainerWithConnectivityChecker(
        child: ListOfCartItems(),
      ),
    );
  }
}
