import 'package:flutter/material.dart';
import 'package:houlala/widget/custom_avatar.dart';

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
      width: 150,
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey.shade300,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              4.0,
            )),
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
              Text(
                name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontFamily: 'PoppinsBold', fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
