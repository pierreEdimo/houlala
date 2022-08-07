// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:houlala/helper/constants.dart';
// import 'package:houlala/main.dart';
// import 'package:houlala/model/add_order.dart';
// import 'package:houlala/model/address.dart';
// import 'package:houlala/model/personal_datas.dart';
// import 'package:houlala/model/user_information.dart';
// import 'package:houlala/service/auth_service.dart';
// import 'package:houlala/service/cart_item_service.dart';
// import 'package:houlala/service/order_service.dart';
// import 'package:houlala/widget/address_container.dart';
// import 'package:houlala/widget/checkout_bar.dart';
// import 'package:houlala/widget/custom_elevated_button.dart';
// import 'package:houlala/widget/horizontal_cart_preview.dart';
// import 'package:houlala/widget/personal_data_container.dart';
// import 'package:houlala/widget/show_nack.dart';
// import 'package:houlala/widget/standard_custom_container.dart';
// import 'package:http/http.dart';
// import 'package:provider/provider.dart';
// import '../model/count_and_price.dart';
// import 'display_dialog.dart';
//
// class OnlinePersonalDataContainer extends StatelessWidget {
//   final CountAndPrice? total;
//
//   const OnlinePersonalDataContainer({
//     Key? key,
//     this.total,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AuthService>(
//       builder: (context, authService, child) {
//         PersonalData connectedUser = authService.getUserData();
//
//         return Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     const CheckoutBar(),
//                     standardSizedBox,
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           Text(
//                             "Donnees personnelles",
//                             style: standardStyle,
//                           ),
//                           verticalSpacing,
//                           PersonalDataContainer(
//                             connectedUser: connectedUser,
//                           ),
//                           standardSizedBox,
//                           Text(
//                             "Addresse de Livraison",
//                             style: standardStyle,
//                           ),
//                           verticalSpacing,
//                           const AddressContainer(),
//                           standardSizedBox,
//                           Text(
//                             "Mode de paiement",
//                             style: standardStyle,
//                           ),
//                           verticalSpacing,
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 15.0, horizontal: 5.0),
//                             decoration: BoxDecoration(
//                                 color: Colors.grey.shade200,
//                                 borderRadius: BorderRadius.circular(5.0)),
//                             child: const Text(
//                               "Cash",
//                               style: TextStyle(fontWeight: FontWeight.w700),
//                             ),
//                           ),
//                           standardSizedBox,
//                           Text(
//                             "Produits",
//                             style: standardStyle,
//                           ),
//                           // HorizontalCartPreview(
//                           //   items: items,
//                           // ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             StandardCustomContainer(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     children: [
//                       const Text(
//                         "Prix Total",
//                         style: TextStyle(fontSize: 16.0),
//                       ),
//                       Text(
//                         total!.totalPrice!.toString(),
//                         style: standardStyle,
//                       )
//                     ],
//                   ),
//                   CustomElevatedButton(
//                     child: Text(
//                       '(${total!.totalQuantity.toString()}) Commander',
//                       style: standardStyle,
//                     ),
//                     onPressed: () async {
//                       late List<AddCartItem> newItems = [];
//                       late AddCartItem newItem;
//
//                       String? userId = "";
//
//                       if (!kIsWeb) {
//                         userId = await storage.read(key: "userId");
//                       } else {
//                         userId = userIdBox.get("userId");
//                       }
//
//                       UserInformation user = UserInformation(
//                           firstName: connectedUser.firstName,
//                           lastName: connectedUser.lastName,
//                           telephoneNumber: connectedUser.telephoneNumber,
//                           email: connectedUser.email);
//
//                       Address deliveryAddress =
//                           Provider.of<AuthService>(context, listen: false)
//                               .getAddress();
//
//
//
//                         showSnack(
//                             const Text(
//                                 "Votre Commande a ete envoye, vous serez contacte pour plus d'informations"),
//                             context,
//                             second: 2);
//                       } else {
//                         showErrorDialog(context, "Erreur",
//                             "Desole, nous ne pouvons pas proceder votre commande , veuillez reasseyer, si le probleme persiste, contactez notre service client.");
//                       }
//                     },
//                   )
//                 ],
//               ),
//             )
//           ],
//         );
//       },
//     );
//   }
// }
