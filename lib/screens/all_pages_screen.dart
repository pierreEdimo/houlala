import 'package:flutter/material.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:houlala/widget/store_body_container.dart';

class AllPageScreen extends StatelessWidget {
  const AllPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithReturn(
        title: "Nos Partenaires",
        elevation: 1,
      ),
      body: const SingleChildScrollView(
        child: StandardCustomContainer(
          child: StoreBodyContainer(
            height: 0.5,
          ),
        ),
      ),
    );
  }
}
