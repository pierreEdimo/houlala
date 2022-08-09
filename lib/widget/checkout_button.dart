import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/main.dart';
import 'package:houlala/model/add_unregistered_user_order.dart';
import 'package:houlala/model/user_information.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:houlala/service/order_service.dart';
import 'package:houlala/widget/border_card_title.dart';
import 'package:houlala/widget/bordered_card.dart';
import 'package:houlala/widget/checkout_bar.dart';
import 'package:houlala/widget/custom_elevated_button.dart';
import 'package:houlala/widget/input_email.dart';
import 'package:houlala/widget/input_name.dart';
import 'package:houlala/widget/input_number.dart';
import 'package:houlala/widget/offline_order_container.dart';
import 'package:houlala/widget/order_container.dart';
import 'package:houlala/widget/personnal_data_container.dart';
import 'package:houlala/widget/show_nack.dart';
import 'package:http/http.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../model/offline_order.dart';
import '../model/order.dart';

class CheckoutButton extends StatelessWidget {
  final List<Order>? orders;
  final List<OfflineOrder>? offlineOrders;
  final TextEditingController? _emailController = TextEditingController();
  final TextEditingController? _nameController = TextEditingController();
  final TextEditingController? _streetController = TextEditingController();
  final TextEditingController? _phoneNumber = TextEditingController();
  final TextEditingController? _houseNumberController = TextEditingController();
  final TextEditingController? _cityController =
      TextEditingController(text: 'Yaounde');
  final TextEditingController? _countryController =
      TextEditingController(text: 'Cameroun');
  final TextEditingController? _poBoxController = TextEditingController();

  CheckoutButton({
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
                                        );

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
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CheckoutBar(),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 11.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            BorderedCard(
                              child: Column(
                                children: [
                                  const BorderedCardTitle(
                                    title: "Donnees Personnelles",
                                  ),
                                  EmailInput(
                                    controller: _emailController,
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  NameInput(
                                    hintText: 'Nom',
                                    controller: _nameController,
                                    errorMessage: 'Inserez votre nom',
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          enabled: false,
                                          initialValue: "+237",
                                          decoration: const InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 15.0),
                                              border: OutlineInputBorder()),
                                        ),
                                      ),
                                      horizontalSpacing,
                                      Expanded(
                                        flex: 4,
                                        child: InputNumber(
                                          controller: _phoneNumber,
                                          hintText: 'Numero de telephone',
                                          errorMessage:
                                              'Inserez votre Numero de telephone',
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            BorderedCard(
                              child: Column(
                                children: [
                                  const BorderedCardTitle(
                                    title: "Addresse",
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: NameInput(
                                          hintText: 'Rue',
                                          errorMessage: 'Inserez votre rue',
                                          controller: _streetController,
                                        ),
                                      ),
                                      horizontalSpacing,
                                      Expanded(
                                        child: TextFormField(
                                          controller: _houseNumberController,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 15.0),
                                              labelText: 'N.r',
                                              border: OutlineInputBorder()),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  TextFormField(
                                    controller: _poBoxController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                        vertical: 15.0,
                                      ),
                                      border: OutlineInputBorder(),
                                      labelText: "B.P",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  NameInput(
                                    enabled: false,
                                    hintText: 'ville',
                                    errorMessage: 'Inserez votre Ville',
                                    controller: _cityController,
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  NameInput(
                                    enabled: false,
                                    hintText: 'Pays',
                                    errorMessage: 'Inserez votre Pays',
                                    controller: _countryController,
                                  )
                                ],
                              ),
                            ),
                            BorderedCard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const BorderedCardTitle(
                                    title: "Mode de Paiement",
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
                                          fontSize: customFontSize,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            ListView(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              children: offlineOrders!
                                  .map((order) => OfflineOrderContainer(
                                        status: 'confirmation',
                                        order: order,
                                      ))
                                  .toList(),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: CustomElevatedButton(
                                onPressed: () async {
                                  UserInformation info = UserInformation(
                                    email: _emailController!.text,
                                    name: _nameController!.text,
                                    telephoneNumber: _phoneNumber!.text,
                                    streetName: _streetController!.text,
                                    houseNumber: _houseNumberController!.text,
                                    city: _cityController!.text,
                                    country: _countryController!.text,
                                    poBox: _poBoxController!.text,
                                  );

                                  try {
                                    for (var order in offlineOrders!) {
                                      UnregisteredUserOrder newOrder =
                                          UnregisteredUserOrder(
                                              locationId: order.locationId,
                                              userInformation: info,
                                              cartItems: order.cartItems);

                                      await Provider.of<OrderService>(context,
                                              listen: false)
                                          .confirmUnregisteredUserOrder(
                                              newOrder);
                                    }

                                    Provider.of<OrderService>(context,
                                            listen: false)
                                        .deleteAfterOrder(offlineOrders!);
                                    Navigator.of(context).pop();
                                  } catch (e) {
                                    print(e);
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
          },
        );
      },
    );
  }
}
