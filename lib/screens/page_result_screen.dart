import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/controllers/product_controller.dart';
import 'package:houlala/models/page_result_args/page_result_args.dart';
import 'package:houlala/models/product/product_model.dart';
import 'package:houlala/shared_widgets/product_container.dart';
import '../widget/custom_button_container.dart';

class PageResultScreen extends ConsumerWidget {
  static String routeName = '/pagesearchResultScreen';

  const PageResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductController productController = ProductController(ref);
    final args = ModalRoute.of(context)!.settings.arguments as PageResultArgs;
    List<ProductModel> productList = productController
        .getFilteredProductByLocation(args.locationName!, args.keyWord!);

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.angleLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('${args.locationName}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 15.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('${productList.length} produit(s) retrouves'),
              const SizedBox(height: 10.0),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.2,
                children: productList
                    .map(
                      (product) => ProductContainer(
                        productModel: product,
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
