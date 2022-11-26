import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/main.dart';
import 'package:houlala/model/send_email.dart';
import 'package:houlala/model/user_information.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:houlala/service/email_service.dart';
import 'package:houlala/service/order_service.dart';
import 'package:houlala/widget/checkout_bar.dart';
import 'package:houlala/widget/custom_elevated_button.dart';
import 'package:houlala/widget/order_container.dart';
import 'package:houlala/widget/personnal_data_container.dart';
import 'package:houlala/widget/show_nack.dart';
import 'package:houlala/widget/unregisterd_user_order_form.dart';
import 'package:http/http.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
      child: Text(
        "Caisse",
        style: standardStyle,
      ),
      onPressed: () async {
        String? email = await storage.read(key: "email");
        showMaterialModalBottomSheet(
          expand: true,
          context: context,
          builder: (BuildContext context) {
            switch (loggedState) {
              case 'loggedIn':
                return FutureBuilder(
                  future:
                      Provider.of<AuthService>(context).fetchConnectedUser(),
                  builder: (BuildContext context,
                      AsyncSnapshot<UserInformation> snapshot) {
                    if (snapshot.hasData) {
                      UserInformation? connectedUser = snapshot.data;

                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const CheckoutBar(),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 11.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  PersonnalDataContainer(
                                    connectedUser: connectedUser,
                                  ),
                                  Card(
                                    color: Colors.transparent,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 100.w,
                                            margin: const EdgeInsets.only(
                                                bottom: 10.0),
                                            child: const Text(
                                              "Mode de Paiement",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "PoppinsBold"),
                                            ),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        width: 1,
                                                        color: Colors
                                                            .grey.shade300))),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.money_outlined,
                                                color: Colors.green,
                                                size: 18.0,
                                              ),
                                              const SizedBox(
                                                width: 5.0,
                                              ),
                                              Text(
                                                "Cash",
                                                style: TextStyle(
                                                    fontSize: customFontSize),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  ListView(
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    children: orders!
                                        .map((order) => OrderContainer(
                                              status: 'confirmation',
                                              order: order,
                                              confirmed: false,
                                            ))
                                        .toList(),
                                  ),
                                  Container(
                                    height: 55,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: CustomElevatedButton(
                                      onPressed: () async {
                                        UserInformation info = UserInformation(
                                          id: connectedUser!.id!,
                                          email: email,
                                          name: connectedUser.name!,
                                          country: connectedUser.country!,
                                          city: connectedUser.city!,
                                          streetName: connectedUser.streetName!,
                                          poBox: connectedUser.poBox!,
                                          telephoneNumber:
                                              connectedUser.telephoneNumber!,
                                          userName: connectedUser.userName!,
                                          houseNumber:
                                              connectedUser.houseNumber!,
                                          firstName: connectedUser.firstName!,
                                        );

                                        for (var order in orders!) {
                                          SimplifiedOrder orderEmail =
                                              SimplifiedOrder(
                                                  status: order.status,
                                                  cartItems: order.cartItems,
                                                  payMentMode:
                                                      order.paymentMode,
                                                  totalQuantity:
                                                      order.totalQuantity,
                                                  totalPrice: order.totalPrice);

                                          var newEmail = SendEmail(
                                            subject:
                                                "Nouvelle commande venant de ${connectedUser.name}, ${connectedUser.firstName}",
                                            to: order.location!.email!,
                                            userInformation: connectedUser,
                                            order: orderEmail,
                                          );

                                          await Provider.of<EmailService>(
                                                  context,
                                                  listen: false)
                                              .sendEmail("order", newEmail);
                                        }

                                        Response response =
                                            await Provider.of<OrderService>(
                                                    context,
                                                    listen: false)
                                                .confirmCommand(info);

                                        if (response.statusCode == 204) {
                                          showSnack(
                                            const Text(
                                                "Votre Commande a ete envoye avec succes"),
                                            context,
                                          );
                                          Navigator.of(context).pop();
                                        }
                                      },
                                      child: Text(
                                        "Commander",
                                        style: standardStyle,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              case null:
              default:
                return UnregisteredUserBorderForm(
                  offlineOrders: offlineOrders,
                );
            }
          },
        );
      },
    );
  }
}
