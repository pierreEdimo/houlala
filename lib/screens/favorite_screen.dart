import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/grid_of_products.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:sizer/sizer.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = '/favorites';

  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? userId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBarWithReturn(
        title: "Mes Favories",
        elevation: 1,
      ),
      body: StandardCustomContainer(
        child: SingleChildScrollView(
          child: GridOfProducts(
            height: 80.h,
            textError: "Aucuns produits enregistrees dans les Favories",
            uri: '${dotenv.env['PRODUCT_URL']}/favorites?userId=$userId',
            crossAxisCount: 1,
            scrollDirection: Axis.vertical,
            widthRatio: 1,
            heightRatio: 0.5,
            displayType: "favories",
          ),
        ),
      ),
    );
  }
}
