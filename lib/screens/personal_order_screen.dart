import 'package:flutter/material.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/list_of_orders.dart';

class PersonalOrderScreen extends StatelessWidget {
  const PersonalOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithReturn(
        title: "Mes Commandes",
        elevation: 1,
      ),
      body: const ListOfOrders(),
    );
  }
}
