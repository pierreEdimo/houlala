import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/controllers/order_controller.dart';
import 'package:houlala/controllers/product_controller.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/helper/user_token.helper.dart';
import 'package:houlala/shared_widgets/container_wirth_connectivity_checker.dart';
import 'package:houlala/shared_widgets/custom_avatar.dart';
import 'package:houlala/shared_widgets/custom_body_container.dart';
import 'package:houlala/shared_widgets/custom_elevated_button.dart';
import 'package:houlala/shared_widgets/item_container.dart';
import 'package:houlala/shared_widgets/material_container.dart';
import '../shared_widgets/custom_button_container.dart';

class CartItemScreen extends ConsumerWidget {
  const CartItemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    OrderController orderController = OrderController(ref);
    ProductController productController = ProductController(ref);
    bool isUserConnected = UserTokenHelper.getUserToken() != null;
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: const CircleAvatar(
          radius: 35,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('images/houlala1.png'),
        ),
        title: const Text("Mon panier"),
        actions: [
          CustomButtonContainer(
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
            onPressed: () => Navigator.of(context).pushNamed("/search"),
          )
        ],
      ),
      body: isUserConnected
          ? FilledOrders(
              orderController: orderController,
              productController: productController,
            )
          : const Center(
              child: Text("unconnected"),
            ),
    );
  }
}

class FilledOrders extends StatelessWidget {
  final OrderController? orderController;
  final ProductController? productController;

  const FilledOrders({
    super.key,
    this.orderController,
    this.productController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerWithConnectivityChecker(
        child: CustomBodyContainer(
          loading: orderController!.loading,
          error: orderController!.error,
          errorMessage: orderController!.errorMessage,
          loadingHeight: MediaQuery.of(context).size.height * 1,
          child: orderController!.unConfirmedOrders.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomAvatar(
                        radius: 50,
                        localAsset: "images/no-shopping-cart.png",
                      ),
                      standardSizedBox,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Il n'y'a aucuns produits dans votre panier.",
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                )
              : Column(
                  children: [
                    MaterialContainer(
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        child: CustomElevatedButton(
                          hasBorder: false,
                          onPressed: () =>
                              Navigator.of(context).pushNamed('/checkout'),
                          color: Colors.orange,
                          child: const Text("Proceder au paiement."),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: orderController!.unConfirmedOrders
                            .map((order) => CartItemContainer(
                                  orderModel: order,
                                  orderController: orderController,
                                  productController: productController,
                                ))
                            .toList(),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
