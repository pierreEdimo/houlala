import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houlala/shared_widgets/custom_column_container.dart';
import 'package:houlala/shared_widgets/markdown_container.dart';
import 'package:houlala/shared_widgets/page_contact_information.dart';
import 'dart:convert';
import '../helper/constants.dart';
import '../models/location/location_model.dart';

class PageInfoContainer extends StatelessWidget {
  final LocationModel? page;

  const PageInfoContainer({super.key, this.page});

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
