import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/service/job_service.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/background_image.dart';
import 'package:houlala/widget/custom_elevated_button.dart';
import 'package:houlala/widget/markdown_container.dart';
import 'package:houlala/widget/transformed_container.dart';
import 'package:provider/provider.dart';

import '../model/job.dart';

class JobsDetailContainer extends StatelessWidget {
  final String? uri;

  const JobsDetailContainer({Key? key, this.uri}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<JobService>(context).fetchSingleProduct(uri!),
      builder: (context, AsyncSnapshot<Job> snaphot) {
        if (snaphot.hasData) {
          Job job = snaphot.data!;

          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: BackgroundImage(
                        imageUrl: job.page!.imageUrl!,
                      ),
                    ),
                    AppBarWithReturn(
                      title: "",
                      elevation: 0.0,
                      color: Colors.transparent,
                    )
                  ],
                ),
                TransformedContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.jobTitel!,
                        style: detailTitleStyle,
                      ),
                      Text(
                        '${job.page!.name!} . ${job.jobLocationCity}, ${job.jobLocationCountry}(${job.jobOption})',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      standardSizedBox,
                      Row(
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.briefcase,
                            size: 16,
                          ),
                          horizontalSpacing,
                          Flexible(
                            child: Text(
                              '${job.jobType} . ${job.experienceLevel}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                      standardSizedBox,
                      CustomElevatedButton(
                        child: const Text(
                          "Postuler",
                          style: TextStyle(
                            fontFamily: 'PoppinsBold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () => print("Hello World"),
                      ),
                      standardSizedBox,
                      MarkdownContainer(
                        data: job.jobDescription!,
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
