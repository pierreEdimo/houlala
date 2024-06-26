import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houlala/shared_widgets/custom_column_container.dart';
import 'package:houlala/shared_widgets/launch_url.dart';
import '../helper/constants.dart';
import '../models/location/location_model.dart';

class PageContactInformation extends StatelessWidget {
  final LocationModel? page;

  const PageContactInformation({super.key, this.page});

  @override
  Widget build(BuildContext context) {
    return CustomColumnContainer(
      title: Text(
        "Contacts",
        style: GoogleFonts.jetBrainsMono(
          textStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "E-mail:",
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
                      fontWeight: FontWeight.bold,
                    ),
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          verticalSpacing,
          Text(
            "Domaine: ${page!.category!.name!}",
          ),
          verticalSpacing,
          Text("Site: ${page!.country!.name!} "),
          verticalSpacing,
          Text("Prenom: ${page!.creator!.firstName!}"),
          verticalSpacing,
          Text("Nom: ${page!.creator!.lastName!}"),
          verticalSpacing,
          Text(
              "Adresse: ${page!.address!.streetName!} ${page!.address!.city!}, ${page!.country!.name!} ")
        ],
      ),
    );
  }
}
