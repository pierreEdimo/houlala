import 'package:flutter/material.dart';
import 'package:houlala/main.dart';
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
        ? const Text("")
        : FutureBuilder(
            future: Provider.of<CartItemService>(context).getCountItem(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                int? countItem = snapshot.data;
                return countItem! < 1
                    ? const Text("")
                    : Positioned(
                        top: -3.0,
                        right: 0.0,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                              child: Text(
                                countItem.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 9.0
                                ),
                              ),
                            )
                          ],
                        ),
                      );
              }
              return const Text("");
            },
          );
  }
}

getUserId() async {
  return await storage.read(key: "userId");
}
