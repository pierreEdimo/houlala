import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/model/page.dart';
import 'package:houlala/widget/custom_column_container.dart';
import 'package:houlala/widget/launch_url.dart';
import 'package:houlala/widget/page_contact_row.dart';

import '../helper/constants.dart';

class PageContactInformation extends StatelessWidget {
  final PageModel? page;

  const PageContactInformation({Key? key, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomColumnContainer(
      child: const Text(
        "Contacts",
        style: TextStyle(fontSize: 17.0),
      ),
      gridList: Column(
        children: [
          GestureDetector(
            onTap: () => openContact('mailto', page!.email!),
            child: PageContactRow(
              icon: FontAwesomeIcons.envelope,
              child: Text(
                page!.email!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          verticalSpacing,
          GestureDetector(
            onTap: () => openContact('tel', page!.telephoneNumber!),
            child: PageContactRow(
              icon: FontAwesomeIcons.phone,
              child: Text(
                page!.telephoneNumber!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          verticalSpacing,
          const PageContactRow(
            icon: FontAwesomeIcons.briefcase,
            child: Text("Assurances"),
          ),
          verticalSpacing,
          PageContactRow(
            icon: FontAwesomeIcons.building,
            child: Text("Bayreuth, ${page!.headQuartersCountry!}"),
          )
        ],
      ),
    );
  }
}
