

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houlala/models/location/location_model.dart';
import 'package:houlala/screens/page_detail_screen.dart';

class HorizontalLocationContainer extends StatelessWidget {
  final LocationModel? locationModel;

  const HorizontalLocationContainer({
    super.key,
    this.locationModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(PageDetailScreen.routeName, arguments: locationModel!.id!),
      child: Material(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8.0),
        elevation: 3,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    locationModel!.imageUrl!,
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        locationModel!.name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ),
                      Text(
                        locationModel!.category!.name!,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w100
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
