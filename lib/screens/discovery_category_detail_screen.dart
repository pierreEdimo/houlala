import 'package:flutter/material.dart';
import 'package:houlala/model/store_category_argument.dart';

class DiscoveryCategoryDetailScreen extends StatelessWidget {
  const DiscoveryCategoryDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final discoveryCategoryDetailObject =
        ModalRoute.of(context)!.settings.arguments as StoreCategoryArguments;
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('discovery'),
      ),
    );
  }
}
