import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/model/page.dart';
import 'package:houlala/widget/custom_column_container.dart';
import 'package:houlala/widget/page_contact_information.dart';

class PageInfoContainer extends StatelessWidget {
  final PageModel? page;

  const PageInfoContainer({Key? key, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomColumnContainer(
          child: const Text(
            "Historique",
            style: TextStyle(fontSize: 17.0),
          ),
          gridList: Markdown(
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            data: page!.description!,
          ),
        ),
        standardSizedBox,
        PageContactInformation(
          page: page,
        )
      ],
    );
  }
}
