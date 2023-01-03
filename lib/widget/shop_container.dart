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
                child: Container(
                  width: 100.w,
                  color: const Color(0xf2f2f2f2),
                ),
              ),
              SizedBox(
                height: 30.h,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(imageUrl!),
                      ),
                      Text(
                        categoryName!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 28.0,
                          fontFamily: "poppinsBold",
                        ),
                      ),
                    ],
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
