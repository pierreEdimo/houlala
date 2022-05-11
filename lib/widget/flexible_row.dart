import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';

class FlexibleRow extends StatelessWidget {
  final String? title;
  final String? urlValue;

  const FlexibleRow({Key? key, this.title, this.urlValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title!,
            style: standardStyle,
          ),
        ),
        InkWell(
          onTap: () => Navigator.of(context).pushNamed(urlValue!),
          child: const Text(
            "plus",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'PoppinsBold'
            ),
          ),
        )
      ],
    );
  }
}
