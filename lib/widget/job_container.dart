import 'package:flutter/material.dart';
import 'package:houlala/model/job.dart';
import 'package:houlala/screens/jobs_detail_screen.dart';

class JobContainer extends StatelessWidget {
  final Job? job;

  const JobContainer({Key? key, this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(JobsDetailScreen.routeName, arguments: job!.id!),
      child: Card(
        color: Colors.transparent,
        elevation: 0.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(job!.page!.imageUrl!),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job!.jobTitel!,
                    style: const TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'PoppinsBold',
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(job!.page!.name!),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '${job!.jobLocationCity!} . ${job!.jobLocationCountry!}(${job!.jobType!})',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
