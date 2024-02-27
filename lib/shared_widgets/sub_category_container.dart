import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houlala/controllers/product_controller.dart';
import 'package:houlala/model/sub_category_parameter.dart';
import 'package:houlala/models/product/product_model.dart';
import 'package:houlala/models/sub_category/sub_category_model.dart';
import 'package:houlala/shared_widgets/product_container.dart';

class SubCategoryContainer extends ConsumerWidget {
  final SubCategoryModel? subCategoryModel;

  const SubCategoryContainer({
    super.key,
    this.subCategoryModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductController productController = ProductController(ref);
    List<ProductModel> productList = productController
        .getProductListsByCategoryNameAndSubCategoryName(
            subCategoryModel!.categoryName!, subCategoryModel!.label!)
        .toList();
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Material(
        elevation: 3.0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 15.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      subCategoryModel!.imageUrl!,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subCategoryModel!.label!,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Text('${productList.length} resultat(s)')
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                childAspectRatio: 1 / 1.2,
                children: productList
                    .take(4)
                    .map(
                      (product) => ProductContainer(
                        productModel: product,
                      ),
                    )
                    .toList(),
              ),
              productList.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pushNamed(
                            '/sub_category',
                            arguments: SubCategoryParameter(
                                label: subCategoryModel!.label!,
                                id: subCategoryModel!.id!,
                                categoryName: subCategoryModel!.categoryName,
                                thumbNail: subCategoryModel!.imageUrl),
                          ),
                          child: const Text(
                            'Voire tout',
                          ),
                        )
                      ],
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
