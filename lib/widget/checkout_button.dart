import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/main.dart';
import 'package:houlala/model/user_information.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:houlala/widget/checkout_bar.dart';
import 'package:houlala/widget/custom_elevated_button.dart';
import 'package:houlala/widget/registered_user_form.dart';
import 'package:houlala/widget/unregisterd_user_order_form.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../model/offline_order.dart';
import '../model/order.dart';

class CheckoutButton extends StatelessWidget {
  final List<Order>? orders;
  final List<OfflineOrder>? offlineOrders;

  const CheckoutButton({
    Key? key,
    this.orders,
    this.offlineOrders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loggedState = Provider.of<AuthService>(context).getLoggedState();
    return CustomElevatedButton(
      hasBorder: false,
      color: Colors.orangeAccent,
      child: Text(
        "Caisse",
        style: standardStyle,
      ),
      onPressed: () async {
        String? email = await storage.read(key: "email");
        showModalBottomSheet<void>(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 100.h,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SafeArea(
                      child: ModalBar(
                        title: "Terminer sa commande",
                      ),
                    ),
                    loggedState == 'loggedIn'
                        ? FutureBuilder(
                            future: Provider.of<AuthService>(context)
                                .fetchConnectedUser(),
                            builder: (context,
                                AsyncSnapshot<UserInformation> snapshot) {
                              if (snapshot.hasData) {
                                UserInformation? connectedUser = snapshot.data!;
                                return RegisteredUserForm(
                                  orders: orders,
                                  connectedUser: connectedUser,
                                  email: email,
                                );
                              }
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          )
                        : UnregisteredUserBorderForm(
                            offlineOrders: offlineOrders,
                          ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
