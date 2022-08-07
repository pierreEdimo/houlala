import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/widget/blur_container.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/background_image.dart';
import 'package:sizer/sizer.dart';

class ShopContainer extends StatelessWidget {
  final String? imageUrl;
  final Widget? child;
  final String? categoryName;

  const ShopContainer({
    Key? key,
    this.imageUrl,
    this.child,
    this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 35.h,
                child: BackgroundImage(
                  borderRadius: 0.0,
                  imageUrl: imageUrl,
                ),
              ),
              const BlurContainer(),
              SizedBox(
                height: 30.h,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Text(
                    categoryName!,
                    style: detailTitleStyle,
                  ),
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
