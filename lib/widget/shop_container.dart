import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/background_image.dart';
import 'package:sizer/sizer.dart';

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
                height: 50.h,
                child: BackgroundImage(
                  borderRadius: 0.0,
                  imageUrl: imageUrl,
                ),
              ),
              SizedBox(
                height: !kIsWeb ? null : 70.0,
                child: AppBarWithReturn(
                  color: Colors.transparent,
                  elevation: 0,
                  title: "",
                ),
              )
            ],
          ),
          child!
        ],
      ),
    );
  }
}
