import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houlala/widget/custom_column_container.dart';
import 'package:houlala/widget/markdown_container.dart';
import 'package:houlala/widget/page_contact_information.dart';
import 'dart:convert';
import '../helper/constants.dart';
import '../models/location/location_model.dart';

class PageInfoContainer extends StatelessWidget {
  final LocationModel? page;

  const PageInfoContainer({Key? key, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomColumnContainer(
          title: Text(
            "A propos",
            style: GoogleFonts.jetBrainsMono(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          child: MarkdownContainer(
            data: utf8.decode(
              page!.description!.runes.toList(),
            ),
          ),
        ),
        verticalSpacing,
        PageContactInformation(
          page: page,
        )
      ],
    );
  }
}
