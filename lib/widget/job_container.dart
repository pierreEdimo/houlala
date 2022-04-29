import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/model/job.dart';
import 'package:houlala/screens/jobs_detail_screen.dart';
import 'package:houlala/widget/transparent_card_container.dart';

class JobContainer extends StatelessWidget {
  final Job? job;

  const JobContainer({Key? key, this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(JobsDetailScreen.routeName, arguments: job!.id!),
      child: TransparentCardContainer(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(job!.page!.imageUrl!),
            ),
            horizontalSpacing,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job!.jobTitel!,
                    style: standardStyle,
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    job!.page!.name!,
                    style: subtitle,
                  ),
                  Text(
                    '${job!.jobLocationCity!} . ${job!.jobLocationCountry!}(${job!.jobType!})',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: subtitle,
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
