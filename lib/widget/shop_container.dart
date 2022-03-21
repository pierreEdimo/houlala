import 'package:flutter/material.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/background_image.dart';

class ShopContainer extends StatelessWidget {
  final String? imageUrl;
  final Widget? child;

  const ShopContainer({Key? key, this.imageUrl, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: BackgroundImage(
                  imageUrl: imageUrl,
                ),
              ),
              AppBarWithReturn(
                color: Colors.transparent,
                elevation: 0,
                title: "",
              )
            ],
          ),
          child!
        ],
      ),
    );
  }
}
