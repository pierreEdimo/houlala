import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/model/page.dart';
import 'package:houlala/widget/custom_column_container.dart';
import 'package:houlala/widget/page_contact_row.dart';

class PageContactInformation extends StatelessWidget {
  final PageModel? page;

  const PageContactInformation({Key? key, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   CustomColumnContainer(
      child: const Text(
        "Contacts",
        style: TextStyle(fontSize: 17.0),
      ),
      gridList: Column(
        children: [
         GestureDetector(
           onTap: () => print(page!.email!),
           child: PageContactRow(
             icon: FontAwesomeIcons.envelope,
             info: page!.email!  ,
           ),
         ),
          const SizedBox(
            height: 10.0,
          ),
          GestureDetector(
            onTap: () => print(page!.telephoneNumber),
            child: PageContactRow(
              icon: FontAwesomeIcons.phone,
              info: page!.telephoneNumber!,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const PageContactRow(
            icon: FontAwesomeIcons.briefcase,
            info: "Assurances",
          ),
          const SizedBox(
            height: 10.0,
          ),
          PageContactRow(
            icon: FontAwesomeIcons.building,
            info: "Bayreuth, ${page!.headQuartersCountry!}",
          )
        ],
      ),
    );
  }
}
