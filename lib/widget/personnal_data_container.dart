import 'package:flutter/material.dart';
import 'package:houlala/service/cart_item_service.dart';
import 'package:houlala/widget/cart_item_container.dart';
import 'package:houlala/widget/checkout_bar.dart';
import 'package:houlala/widget/display_dialog.dart';
import 'package:houlala/widget/input_name.dart';
import 'package:houlala/widget/input_number.dart';
import 'package:houlala/widget/show_nack.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../helper/constants.dart';
import '../model/CountAndPrice.dart';
import '../model/add_cart_item.dart';
import '../model/add_order.dart';
import '../model/address.dart';
import '../model/cart_item.dart';
import '../model/user_information.dart';
import '../service/order_service.dart';
import 'custom_elevated_button.dart';
import 'input_email.dart';

class PersonalDataContainer extends StatefulWidget {
  final List<CartItem>? items;
  final CountAndPrice? total;

  const PersonalDataContainer({
    Key? key,
    this.items,
    this.total,
  }) : super(key: key);

  @override
  State<PersonalDataContainer> createState() => _PersonalDataContainerState();
}

class _PersonalDataContainerState extends State<PersonalDataContainer> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _villeController =
      TextEditingController(text: "Yaounde");
  final TextEditingController _countryController =
      TextEditingController(text: "Cameroun");
  final TextEditingController _streetController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _firstNameController.dispose();
    _emailController.dispose();
    _numberController.dispose();
    _villeController.dispose();
    _countryController.dispose();
    _streetController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CheckoutBar(),
                standardSizedBox,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Donnees personnelles",
                          style: standardStyle,
                        ),
                        verticalSpacing,
                        Column(
                          children: [
                            EmailInput(
                              controller: _emailController,
                            ),
                            verticalSpacing,
                            NameInput(
                              hintText: "Nom",
                              errorMessage: "inserer votre nom",
                              controller: _nameController,
                            ),
                            verticalSpacing,
                            NameInput(
                              hintText: "Prenom",
                              controller: _firstNameController,
                              errorMessage: "inserer votre prenom",
                            ),
                            verticalSpacing,
                            InputNumber(
                              hintText: "numero de telephone",
                              errorMessage: "inserer votre numero de telephone",
                              controller: _numberController,
                            )
                          ],
                        ),
                        standardSizedBox,
                        Text(
                          "Adresse de Livraison",
                          style: standardStyle,
                        ),
                        verticalSpacing,
                        Column(
                          children: [
                            NameInput(
                              enabled: false,
                              hintText: "",
                              controller: _villeController,
                            ),
                            verticalSpacing,
                            NameInput(
                              hintText: "Rue",
                              controller: _streetController,
                              errorMessage: "inserer votre rue",
                            ),
                            verticalSpacing,
                          ],
                        ),
                        standardSizedBox,
                        Text(
                          "Mode de paiement",
                          style: standardStyle,
                        ),
                        verticalSpacing,
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: const Text(
                            "Cash",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                        standardSizedBox,
                        Text(
                          "Produits",
                          style: standardStyle,
                        ),
                        SizedBox(
                          height: 25.h,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: widget.items!
                                .map((CartItem item) => CartItemContainer(
                                      horizontal: "horizontal",
                                      cartItem: item,
                                    ))
                                .toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        StandardCustomContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    "Prix Total",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    widget.total!.totalPrice!.toString(),
                    style: standardStyle,
                  )
                ],
              ),
              CustomElevatedButton(
                child: Text(
                  '(${widget.total!.totalQuantity.toString()}) Commander',
                  style: standardStyle,
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    late List<AddCartItem> newItems = [];
                    late AddCartItem newItem;
                    for (var item in widget.items!) {
                      newItem = AddCartItem(
                          pageId: item.product!.page!.id,
                          productName: item.product!.name!,
                          productId: item.product!.id,
                          totalPrice: item.totalPrice,
                          quantity: item.quantity);
                      newItems.add(newItem);
                    }

                    UserInformation user = UserInformation(
                      firstName: _firstNameController.text,
                      lastName: _nameController.text,
                      telephoneNumber: '+237${_numberController.text}',
                      email: _emailController.text,
                    );

                    Address livraisonAddress = Address(
                        city: _villeController.text,
                        country: _countryController.text,
                        streetName: _streetController.text,
                        poBox: "1100");

                    AddOrder newOrder = AddOrder(
                        totalQuantity: widget.total!.totalQuantity!,
                        totalPrice: widget.total!.totalPrice!,
                        cartItems: newItems,
                        address: livraisonAddress,
                        user: user,
                        payMentMode: "Cash",
                        orderOptions: "Livraison",
                        status: "Attente");

                    Response response =
                        await Provider.of<OrderService>(context, listen: false)
                            .addOrder(newOrder);

                    if (response.statusCode == 201) {
                      Navigator.of(context).pop();

                      Provider.of<CartItemService>(context, listen: false)
                          .deleteOfflineCartItems();

                      showSnack(
                          const Text(
                              "Votre Commande a ete envoye, vous serez contacte pour plus d'informations"),
                          context);
                    } else {
                      showErrorDialog(context, "Erreur",
                          "Desole, nous ne pouvons pas proceder votre commande , veuillez reasseyer, si le probleme persiste, contactez notre service client.");
                    }
                  }
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
