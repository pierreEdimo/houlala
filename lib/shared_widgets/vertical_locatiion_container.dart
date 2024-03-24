import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houlala/controllers/product_controller.dart';
import 'package:houlala/models/product/product_model.dart';
import 'package:houlala/screens/page_detail_screen.dart';
import 'package:houlala/shared_widgets/product_column.dart';
import '../models/location/location_model.dart';

class VerticaLocationContainer extends ConsumerWidget {
  final LocationModel? locationModel;

  const VerticaLocationContainer({
    super.key,
    this.locationModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductController productController = ProductController(ref);
    List<ProductModel> productList =
        productController.getProductListsByLocation(locationModel!.name!);
    return Material(
      color: Colors.grey.shade50,
      borderRadius: BorderRadius.circular(8.0),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ProductColumn(
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(locationModel!.imageUrl!),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locationModel!.name!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.jetBrainsMono(
                              textStyle: const TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          locationModel!.category!.name!,
                          style: const TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w100),
                        ),
                        Text('${productList.length} produit(s)')
                      ],
                    ),
                  )
                ],
              ),
              productList: productList.take(4).toList(),
            ),
            const SizedBox(height: 10.0),
            Container(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () => Navigator.of(context).pushNamed(
                    PageDetailScreen.routeName,
                    arguments: locationModel!.id),
                child: const Text(
                  'Voire tout',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
