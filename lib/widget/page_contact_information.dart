import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/model/location.dart';
import 'package:houlala/widget/custom_column_container.dart';
import 'package:houlala/widget/launch_url.dart';
import 'package:houlala/widget/page_contact_row.dart';

import '../helper/constants.dart';

class PageContactInformation extends StatelessWidget {
  final LocationModel? page;

  const PageContactInformation({Key? key, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomColumnContainer(
      child: const Text(
        "Contacts",
        style: TextStyle(
          fontSize: 22.0,
          fontFamily: 'PoppinsBold',
          fontWeight: FontWeight.bold,
        ),
      ),
      gridList: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "E-mail:",
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Flexible(
                child: GestureDetector(
                  onTap: () => openContact('mailto', page!.email!),
                  child: Text(
                    page!.email!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          verticalSpacing,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Telephone:",
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Flexible(
                child: GestureDetector(
                  onTap: () => openContact('tel', page!.telephoneNumber!),
                  child: Text(
                    page!.telephoneNumber!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ),
              ),
            ],
          ),
          verticalSpacing,
          Text(
            "Domaine: ${page!.category!.name!}",
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          verticalSpacing,
          Text(
            "Site: ${page!.country!.name!} ",
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          verticalSpacing,
          Text(
            "Prenom: ${page!.creator!.firstName!}",
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          verticalSpacing,
          Text(
            "Nom: ${page!.creator!.lastName!}",
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          verticalSpacing,
          Text(
            "Adresse: ${page!.address!.streetName!} ${page!.address!.city!}, ${page!.country!.name!} ",
            style: const TextStyle(
              fontSize: 18.0,
            ),
          )
        ],
      ),
    );
  }
}
