import 'package:flutter/material.dart';
import 'package:houlala/widget/custom_card.dart';
import 'package:houlala/widget/custom_avatar.dart';
import 'package:houlala/widget/product_title.dart';

class SubCategoryContainer extends StatelessWidget {
  final String? name;
  final String? thumbNail;

  const SubCategoryContainer({
    Key? key,
    this.name,
    this.thumbNail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: CustomCard(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomAvatar(
                radius: 25,
                thumbnailUrl: thumbNail!,
              ),
              ProductTitle(
                title: name,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
