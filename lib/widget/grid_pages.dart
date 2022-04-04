import 'package:flutter/material.dart';
import 'package:houlala/model/page.dart';
import 'package:houlala/widget/page_container.dart';
import 'package:provider/provider.dart';
import '../service/page_service.dart';

class GridPages extends StatelessWidget {
  final String? uri;
  final Axis? direction;
  final Widget? child;
  final String? textError;
  final double? height;

  const GridPages({
    Key? key,
    this.uri,
    this.direction,
    this.child,
    this.textError,
    this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<PageService>(context).fetchAllPages(uri!),
      builder: (context, AsyncSnapshot<List<PageModel>> snapshot) {
        if (snapshot.hasData) {
          List<PageModel> pages = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              child != null ? child! : Container(),
              pages.isEmpty
                  ? SizedBox(
                      height: height!,
                      child: Center(
                        child: Text(
                          textError!,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : direction == Axis.horizontal
                      ? Expanded(
                          child: ListView(
                            padding: const EdgeInsets.all(0),
                            scrollDirection: direction!,
                            children: pages
                                .map(
                                  (PageModel page) => PageContainer(
                                    page: page,
                                  ),
                                )
                                .toList(),
                          ),
                        )
                      : ListView(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          children: pages
                              .map((PageModel page) => PageContainer(
                                    page: page,
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
