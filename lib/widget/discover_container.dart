import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/discover_container_box.dart';

class DiscoverContainer extends StatelessWidget {
  const DiscoverContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DiscoverContainerBox(
      height: 1,
      error:
          "Nous n'avons aucunes categories enregistrees en ce moment, svp reessayez plutard",
      uri: dotenv.env['CATEGORY_URL'],
    );
  }
}
