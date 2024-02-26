import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/model/sub_category_parameter.dart';
import 'package:houlala/widget/grid_of_products.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:sizer/sizer.dart';
import '../widget/app_bar_with_return.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subCategoryParameter =
        ModalRoute.of(context)!.settings.arguments as SubCategoryParameter;
    return Scaffold(
      appBar: AppBarWithReturn(
        color: Colors.transparent,
        elevation: 1,
        title: "${subCategoryParameter.label}",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StandardCustomContainer(
              child: GridOfProducts(
                height: 70.h,
                textError: "Aucuns produits appelle n'a ete trouve\n"
                    "svp verifiez plutard",
                uri:
                    '${dotenv.env['PRODUCT_URL']}/sub-categories/${subCategoryParameter.id}/size/0',
                crossAxisCount: 2,
                widthRatio: 1,
                heightRatio: 1.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
