import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        margin:const  EdgeInsets.only(bottom: 8.0),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 90,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: NetworkImage(page!.imageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
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
                          fontSize: 17),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
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
                      Text(page!.pageSpecialisation!.label!)
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
                      Text(
                        '${page!.headQuartersCity!} . ${page!.headQuartersCountry}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
