import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/model/location.dart';
import 'package:sizer/sizer.dart';
import '../screens/page_detail_screen.dart';

class PageContainer extends StatelessWidget {
  final LocationModel? page;
  final double? width;

  const PageContainer({
    Key? key,
    this.page,
    this.width,
  }) : super(key: key);

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
              4.0,
            ),
            border: Border.all(
              width: 1.0,
              color: Colors.grey.shade300,
            )),
        width: width == null ? 80.w : width!,
        height: 90,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                page!.imageUrl!,
              ),
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
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Flexible(
                    child: Text(
                      page!.category!.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: subtitle,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Flexible(
                    child: Text(
                      '${page!.address!.city!}, ${page!.country!.name!}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: subtitle,
                    ),
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
