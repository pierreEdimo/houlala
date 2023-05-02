import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/model/location.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/page_detail_container.dart';

class PageDetailScreen extends StatelessWidget {
  static const screenName = '/pageDetail';

  const PageDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final page = ModalRoute.of(context)!.settings.arguments as LocationModel;
    return Scaffold(
      appBar: AppBarWithReturn(
        elevation: 1,
        color: Colors.transparent,
        title: "${page.name}",
      ),
      body: PageDetailContainer(
        uri: '${dotenv.env['LOCATION_URL']}/${page.id}',
      ),
    );
  }
}
