import 'package:flutter/material.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:houlala/service/cart_item_service.dart';
import 'package:provider/provider.dart';

class ElementOfCartItem extends StatelessWidget {
  const ElementOfCartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? loginState =
        Provider.of<AuthService>(context).getLoggedState();
    return loginState != 'loggedIn'
        ? FutureBuilder(
            future: Provider.of<CartItemService>(context).getOfflineItemCount(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                int? countItem = snapshot.data;
                return countItem! < 1
                    ? const Text("")
                    : PositionedContainer(
                        value: countItem.toString(),
                      );
              }
              return const Text("");
            },
          )
        : FutureBuilder(
            future: Provider.of<CartItemService>(context).getCountItem(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                int? countItem = snapshot.data;
                return countItem! < 1
                    ? const Text("")
                    : PositionedContainer(
                        value: countItem.toString(),
                      );
              }
              return const Text("");
            },
          );
  }
}

class PositionedContainer extends StatelessWidget {
  final String? value;

  const PositionedContainer({
    Key? key,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -3.0,
      right: 0.0,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            child: Text(
              value!,
              style: const TextStyle(
                fontSize: 9.0,
                color: Color(0xffffffff),
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
