import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/jobs_detail_container.dart';

class JobsDetailScreen extends StatelessWidget {
  static const routeName = '/jobs_detail';

  const JobsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: JobsDetailContainer(
        uri: '${dotenv.env['JOB_URL']}/$id',
      ),
    );
  }
}
