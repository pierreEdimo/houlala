import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/model/page.dart';
import '../screens/page_detail_screen.dart';

class PageContainer extends StatelessWidget {
  final PageModel? page;

  const PageContainer({Key? key, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(PageDetailScreen.screenName, arguments: page!.id!),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            border: Border.all(
              width: 1.0,
              color: Colors.grey.shade300,
            )),
        width: MediaQuery.of(context).size.width * 0.85,
        height: 90,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 38,
              backgroundImage: NetworkImage(page!.imageUrl!),
            ),
            horizontalSpacing, 
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      page!.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PoppinsBold',
                          fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.briefcase,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 3.0,
                      ),
                      Flexible(
                        child: Text(
                          page!.pageSpecialisation!.label!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: subtitle,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.building,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 3.0,
                      ),
                      Flexible(
                        child: Text(
                          '${page!.headQuartersCity!} . ${page!.headQuartersCountry}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: subtitle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
