import 'package:flutter/material.dart';
import 'package:houlala/service/job_service.dart';
import 'package:houlala/widget/job_container.dart';
import 'package:provider/provider.dart';

import '../model/job.dart';

class GridOfJobs extends StatelessWidget {
  final String? uri;
  final Widget? child;
  final Axis? scrollDirection;
  final double? ratio;
  final double? height;
  final String? textError;

  const GridOfJobs({
    Key? key,
    this.uri,
    this.child,
    this.scrollDirection,
    this.ratio,
    this.height,
    this.textError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<JobService>(context).fetchAllJobs(uri!),
      builder: (context, AsyncSnapshot<List<Job>> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }
        if (snapshot.hasData) {
          List<Job> jobs = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              child != null ? child! : Container(),
              jobs.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * height!,
                      child: Center(
                        child:
                            Text( textError!, textAlign: TextAlign.center,),
                      ),
                    )
                  :
                  ListView(
                        padding: EdgeInsets.zero,
                        scrollDirection: scrollDirection!,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        children: jobs
                            .map(
                              (Job job) => JobContainer(
                                job: job,
                              ),
                            )
                            .toList(),
                      ),

            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
