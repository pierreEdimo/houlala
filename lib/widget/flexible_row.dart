import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold
              )
            ),
          ),
        ),
        InkWell(
          onTap: () => Navigator.of(context).pushNamed(urlValue!),
          child: const Text(
            "voir tout",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent
            ),
          ),
        )
      ],
    );
  }
}
