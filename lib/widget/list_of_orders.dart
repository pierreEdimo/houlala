import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/model/personal_datas.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:houlala/service/order_service.dart';
import 'package:houlala/widget/order_container.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:provider/provider.dart';

import '../model/order.dart';

class ListOfOrders extends StatelessWidget {
  const ListOfOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
        builder: (BuildContext context, authService, child) {
      PersonalData user = authService.getUserData();

      return FutureBuilder(
          future: Provider.of<OrderService>(context).fetchOrders(
              '${dotenv.env['ORDER_URL']}/getOrdersFromUsers?email=${user.email}'),
          builder: (BuildContext context, AsyncSnapshot<List<Order>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.hasData) {
              List<Order>? orders = snapshot.data;

              return orders!.isEmpty
                  ? const StandardCustomContainer(
                    child: Center(
                        child: Text(
                          "Vous n'avez pas encore commande d'article sur houlala",
                          textAlign: TextAlign.center,
                        ),
                      ),
                  )
                  : ListView(
                      children: orders
                          .map((Order order) => OrderContainer(
                                order: order,
                              ))
                          .toList(),
                    );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
    });
  }
}
