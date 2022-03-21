import 'package:flutter/material.dart';

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
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'PoppinsBold',
            ),
          ),
        ),
        InkWell(
          onTap: () => Navigator.of(context).pushNamed(urlValue!),
          child: const Text(
            "voire tout",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
