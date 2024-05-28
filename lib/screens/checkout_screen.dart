import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/controllers/auth_controller.dart';
import 'package:houlala/controllers/order_controller.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/helper/user_token.helper.dart';
import 'package:houlala/models/order/order_model.dart';
import 'package:houlala/models/user_model/user_model.dart';
import 'package:houlala/models/user_token/user_token.dart';
import 'package:houlala/shared_widgets/custom_button_container.dart';
import 'package:houlala/shared_widgets/custom_column_container.dart';
import 'package:houlala/shared_widgets/custom_elevated_button.dart';
import 'package:houlala/shared_widgets/material_container.dart';
import 'package:houlala/shared_widgets/order_to_confirm.dart';

class CheckoutScreen extends ConsumerWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AuthController authController = AuthController(ref);
    OrderController orderController = OrderController(ref);
    UserModel? connectedUser = authController.connectedUser;
    List<OrderModel> ordersToConfirm = orderController.unConfirmedOrders;

    void confirmOrder() async {
      UserToken? userToken = await UserTokenHelper.getUserToken();
      for (OrderModel orderModel in ordersToConfirm) {
        try {
          orderController.confirmOrders(
              userToken!.userId!, orderModel.location!.email!);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        automaticallyImplyLeading: false,
        leading: CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.angleLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Paiement"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            connectedUser != null
                ? CustomColumnContainer(
                    title: const Text(
                      'Adresse de Livraison',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '${connectedUser.lastName!} ${connectedUser.firstName}',
                        ),
                        Text(
                          '${connectedUser.streetName!} ${connectedUser.houseNumber ?? ''}',
                        ),
                        Text(
                          '${connectedUser.city!} ${connectedUser.poBox ?? ''} ${connectedUser.city}',
                        )
                      ],
                    ),
                  )
                : Container(),
            standardSizedBox,
            const CustomColumnContainer(
              title: Text(
                'Methode de paiement',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.moneyBill,
                    color: Colors.green,
                  ),
                  SizedBox(width: 10),
                  Text("Cash"),
                ],
              ),
            ),
            standardSizedBox,
            ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: ordersToConfirm
                  .map(
                    (e) => OrderToConfirmContainer(
                      orderModel: e,
                    ),
                  )
                  .toList(),
            ),
            standardSizedBox,
            MaterialContainer(
              child: Container(
                height: 50,
                color: Colors.white,
                child: CustomElevatedButton(
                  hasBorder: false,
                  onPressed: () {
                    confirmOrder();
                  },
                  color: Colors.orange,
                  child: const Text("Payer"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
