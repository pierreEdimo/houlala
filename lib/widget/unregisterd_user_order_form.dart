import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper/constants.dart';
import '../model/add_unregistered_user_order.dart';
import '../model/offline_order.dart';
import '../model/user_information.dart';
import '../service/order_service.dart';
import 'border_card_title.dart';
import 'bordered_card.dart';
import 'checkout_bar.dart';
import 'custom_elevated_button.dart';
import 'input_email.dart';
import 'input_name.dart';
import 'input_number.dart';
import 'offline_order_container.dart';

class UnregisteredUserBorderForm extends StatefulWidget {
  final List<OfflineOrder>? offlineOrders;

  const UnregisteredUserBorderForm({
    Key? key,
    this.offlineOrders,
  }) : super(key: key);

  @override
  State<UnregisteredUserBorderForm> createState() =>
      _UnregisteredUserBorderFormState();
}

class _UnregisteredUserBorderFormState
    extends State<UnregisteredUserBorderForm> {
  final _formKey = GlobalKey<FormState>();
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
  final TextEditingController? _firstNameController = TextEditingController();

  @override
  void dispose() {
    _emailController!.dispose();
    _phoneNumber!.dispose();
    _nameController!.dispose();
    _streetController!.dispose();
    _cityController!.dispose();
    _countryController!.dispose();
    _poBoxController!.dispose();
    _houseNumberController!.dispose();
    _firstNameController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                            errorMessage: 'Inserez votre  Nom',
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          NameInput(
                            hintText: 'Prenom',
                            controller: _firstNameController,
                            errorMessage: 'Inserez votre Prenom',
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
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 15.0),
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
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 15.0),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                      children: widget.offlineOrders!
                          .map((order) => OfflineOrderContainer(
                                status: 'confirmation',
                                order: order,
                              ))
                          .toList(),
                    ),
                    Container(
                      height: 55.0,
                      margin: const EdgeInsets.symmetric(vertical: 15.0),
                      child: CustomElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            UserInformation info = UserInformation(
                              email: _emailController!.text,
                              name: _nameController!.text,
                              telephoneNumber: _phoneNumber!.text,
                              streetName: _streetController!.text,
                              houseNumber: _houseNumberController!.text,
                              city: _cityController!.text,
                              country: _countryController!.text,
                              poBox: _poBoxController!.text,
                              firstName: _firstNameController!.text,
                            );

                            try {
                              for (var order in widget.offlineOrders!) {
                                UnregisteredUserOrder newOrder =
                                    UnregisteredUserOrder(
                                        locationId: order.locationId,
                                        userInformation: info,
                                        cartItems: order.cartItems);

                                await Provider.of<OrderService>(context,
                                        listen: false)
                                    .confirmUnregisteredUserOrder(newOrder);
                              }

                              Provider.of<OrderService>(context, listen: false)
                                  .deleteAfterOrder(widget.offlineOrders!);
                              Navigator.of(context).pop();
                            } catch (e) {
                              if (kDebugMode) {
                                print(e);
                              }
                            }
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
        ),

    );
  }
}
