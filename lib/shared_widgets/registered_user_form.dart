
import 'package:flutter/material.dart';
import 'package:houlala/model/user_information.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../helper/constants.dart';
import '../model/send_email.dart';
import '../service/email_service.dart';
import '../model/order.dart';
import 'custom_elevated_button.dart';
import 'order_container.dart';

class RegisteredUserForm extends StatelessWidget {
  final UserInformation? connectedUser;
  final String? email;
  final List<Order>? orders;

  const RegisteredUserForm({
    Key? key,
    this.connectedUser,
    this.email,
    this.orders,
  }) : super(key: key);

  /// Confirme la Commande de l'utilisateur
  confirmCommand(BuildContext context) async {
    for (var order in orders!) {
      SimplifiedOrder orderEmail = SimplifiedOrder(
          status: order.status,
          cartItems: order.cartItems,
          payMentMode: order.paymentMode,
          totalQuantity: order.totalQuantity,
          totalPrice: order.totalPrice);

      var newEmail = SendEmail(
        subject:
            "Nouvelle commande venant de ${connectedUser!.name}, ${connectedUser!.firstName}",
        to: order.location!.email!,
        userInformation: connectedUser,
        order: orderEmail,
      );

      await Provider.of<EmailService>(context, listen: false)
          .sendEmail("order", newEmail);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100.w,
                        margin: const EdgeInsets.only(bottom: 10.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Colors.grey.shade300))),
                        child: const Text(
                          "Mode de Paiement",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "PoppinsBold"),
                        ),
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
                            style: TextStyle(fontSize: customFontSize),
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
                margin: const EdgeInsets.symmetric(vertical: 15.0),
                child: CustomElevatedButton(
                  hasBorder: false,
                  color: Colors.orangeAccent,
                  onPressed: () async => confirmCommand(context),
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
    );
  }
}
