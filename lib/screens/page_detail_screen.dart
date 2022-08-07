import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/page_detail_container.dart';

class PageDetailScreen extends StatelessWidget {
  static const screenName = '/pageDetail';

  const PageDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: PageDetailContainer(
        uri: '${dotenv.env['LOCATION_URL']}/$id',
      ),
    );
  }
}
