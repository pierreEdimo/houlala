import 'package:flutter/material.dart';
import 'package:houlala/widget/container_wirth_connectivity_checker.dart';
import 'package:houlala/widget/discover_container.dart';
import 'package:houlala/widget/standard_custom_app_bar.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Decouvrez",
      ),
      body: const ContainerWithConnectivityChecker(
        child: DiscoverContainer(),
      ),
    );
  }
}
