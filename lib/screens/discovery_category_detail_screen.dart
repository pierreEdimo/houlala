import 'package:flutter/material.dart';
import 'package:houlala/model/store_category_argument.dart';
import 'package:houlala/widget/discovery_category_detail_container.dart';

class DiscoveryCategoryDetailScreen extends StatelessWidget {
  const DiscoveryCategoryDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final discoveryCategoryDetailObject = ModalRoute.of(context)!
        .settings
        .arguments as StoreCategoryArguments;
    return DiscoveryCategoryDetailContainer(
      id: discoveryCategoryDetailObject.id,
      name: discoveryCategoryDetailObject.name,
      thumbNail: discoveryCategoryDetailObject.thumbNail,
    );
  }
}
