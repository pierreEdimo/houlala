import 'package:flutter/material.dart';
import 'package:houlala/model/location.dart';
import 'package:houlala/widget/custom_column_container.dart';
import 'package:houlala/widget/markdown_container.dart';
import 'package:houlala/widget/page_contact_information.dart';

class PageInfoContainer extends StatelessWidget {
  final LocationModel? page;

  const PageInfoContainer({Key? key, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomColumnContainer(
          child: const Text(
            "A Propos",
            style: TextStyle(fontSize: 22.0, fontFamily: "PoppinsBold"),
          ),
          gridList: MarkdownContainer(
            data: page!.description!,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        PageContactInformation(
          page: page,
        )
      ],
    );
  }
}
