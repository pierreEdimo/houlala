import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/model/location.dart';
import 'package:houlala/widget/custom_avatar.dart';
import 'package:houlala/widget/custom_card.dart';
import 'package:sizer/sizer.dart';
import '../screens/page_detail_screen.dart';

class PageContainer extends StatelessWidget {
  final LocationModel? page;
  final double? width;
  final Axis? scrollDirection;

  const PageContainer({
    Key? key,
    this.page,
    this.width,
    this.scrollDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (scrollDirection!) {
      case Axis.horizontal:
        return InkWell(
          onTap: () => Navigator.of(context)
              .pushNamed(PageDetailScreen.routeName, arguments: page!),
          child: SizedBox(
            width: 180,
            child: CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomAvatar(
                    radius: 30,
                    thumbnailUrl: page!.imageUrl!,
                  ),
                  Flexible(
                    child: Text(
                      page!.name!,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PoppinsBold',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      page!.category!.name!,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: subtitle,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      page!.address!.city!,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: subtitle,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      case Axis.vertical:
      default:
        return InkWell(
          onTap: () => Navigator.of(context)
              .pushNamed(PageDetailScreen.routeName, arguments: page!),
          child: SizedBox(
            width: width == null ? 80.w : width!,
            height: 100,
            child: CustomCard(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAvatar(
                    radius: 30,
                    thumbnailUrl: page!.imageUrl,
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
          ),
        );
    }
  }
}
