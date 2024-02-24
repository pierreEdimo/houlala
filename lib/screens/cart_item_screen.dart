import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/widget/container_wirth_connectivity_checker.dart';
import 'package:houlala/widget/list_of_cart_items.dart';
import '../widget/custom_button_container.dart';

class CartItemScreen extends StatelessWidget {
  const CartItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading:  const CircleAvatar(
          radius: 35,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('images/houlala1.png'),
        ),
        title: const Text("Mon panier"),
        actions: [
          CustomButtonContainer(
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
            onPressed: () => Navigator.of(context).pushNamed("/search"),
          )
        ],
      ),
      body: const ContainerWithConnectivityChecker(
        child: ListOfCartItems(),
      ),
    );
  }
}
