import 'package:flutter/material.dart';
import 'grid_of_products.dart';

class FruitsLettucesBoxContainer extends StatelessWidget {
  final String? uri;
  final String? title;

  const FruitsLettucesBoxContainer({Key? key, this.uri, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: GridOfProducts(
        child: Container(
          margin: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            title!,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'PoppinsBold',
                fontSize: 17),
          ),
        ),
        uri: uri,
        scrollDirection: Axis.horizontal,
        crossAxisCount: 1,
        widthRatio: 1.5,
        heightRatio: 1,
      ),
    );
  }
}
