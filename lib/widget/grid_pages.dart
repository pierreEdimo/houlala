import 'package:flutter/material.dart';
import 'package:houlala/model/location.dart';
import 'package:houlala/widget/custom_avatar.dart';
import 'package:houlala/widget/page_container.dart';
import 'package:provider/provider.dart';
import '../service/page_service.dart';

class GridPages extends StatelessWidget {
  final String? uri;
  final Axis? direction;
  final Widget? child;
  final String? textError;
  final double? height;
  final double? width;

  const GridPages(
      {Key? key,
      this.uri,
      this.direction,
      this.child,
      this.width,
      this.textError,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<LocationService>(context).fetchLocations(uri!),
      builder: (context, AsyncSnapshot<List<LocationModel>> snapshot) {
        if (snapshot.hasData) {
          List<LocationModel>? pages = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              child != null ? child! : Container(),
              direction == Axis.horizontal
                  ? Expanded(
                      child: pages.isEmpty
                          ? Center(
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CustomAvatar(
                                  radius: 50,
                                  localAsset: "images/shop.png",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  textError!,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ))
                          : ListView(
                              padding: EdgeInsets.zero,
                              scrollDirection: direction!,
                              children: pages
                                  .map(
                                    (LocationModel page) => PageContainer(
                                      scrollDirection: Axis.horizontal,
                                      page: page,
                                      width: width,
                                    ),
                                  )
                                  .toList(),
                            ),
                    )
                  : pages.isEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * height!,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const CustomAvatar(
                                  radius: 50,
                                  localAsset: "images/shop.png",
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  textError!,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ))
                      : ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          children: pages
                              .map((LocationModel page) => PageContainer(
                                    page: page,
                                    width: width,
                                    scrollDirection: direction,
                                  ))
                              .toList(),
                        )
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
