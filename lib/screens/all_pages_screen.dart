import 'package:flutter/material.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/custom_box_container.dart';
import 'package:houlala/widget/store_body_container.dart';

class AllPageScreen extends StatelessWidget {
  const AllPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithReturn(
        color: Colors.transparent,
        elevation: 1,
        title: "Quelques boutiques",
      ),
      body: const SingleChildScrollView(
        child: CustomBoxContainer(
          child: StoreBodyContainer(
            height: 0.5,
          ),
        ),
      ),
    );
  }
}
