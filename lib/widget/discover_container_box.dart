import 'package:flutter/material.dart';
import 'package:houlala/widget/vertical_grid_of_categories.dart';

class DiscoverContainerBox extends StatelessWidget {
  final String? uri;
  final String? error;
  final double? height;

  const DiscoverContainerBox({
    Key? key,
    this.uri,
    this.error,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: VerticalListOfCategories(
        shrinkwrap: true,
        uri: uri!,
        error: error!,
        height: height!,
      ),
    );
  }
}
