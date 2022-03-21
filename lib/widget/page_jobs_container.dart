import 'package:flutter/material.dart';
import 'package:houlala/widget/grid_of_jobs.dart';

class PageJobsContainer extends StatelessWidget {
  final String? uri;
  final double? height;
  final String? pageName;
  const PageJobsContainer({Key? key, this.uri, this.height, this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridOfJobs(
      scrollDirection: Axis.vertical,
      height: height!,
      ratio: 2.5,
      uri: uri!,
      pageName: pageName!,
    );
  }
}
