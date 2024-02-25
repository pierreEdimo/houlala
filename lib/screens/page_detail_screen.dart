import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/widget/page_detail_container.dart';

import '../widget/custom_button_container.dart';

class PageDetailScreen extends StatelessWidget {
  static const routeName = '/locationDetail';

  const PageDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.angleLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: PageDetailContainer(
        uri: '${dotenv.env['LOCATION_URL']}/$locationId',
      ),
    );
  }
}
