import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/service/page_service.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/background_image.dart';
import 'package:houlala/widget/custom_intern_navigation.dart';
import 'package:houlala/widget/page_home_container.dart';
import 'package:houlala/widget/page_info_container.dart';
import 'package:houlala/widget/page_jobs_container.dart';
import 'package:houlala/widget/page_post_container.dart';
import 'package:houlala/widget/page_product_container.dart';
import 'package:houlala/widget/transformed_container.dart';
import 'package:provider/provider.dart';

import '../model/page.dart';

class PageDetailContainer extends StatelessWidget {
  final String? uri;

  PageDetailContainer({Key? key, this.uri}) : super(key: key);

  final List<String> _menuItems = [
    "accueil",
    "a propos",
    "produits",
    "posts",
    "jobs",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<PageService>(context).fetchSingleProduct(uri!),
        builder: (context, AsyncSnapshot<PageModel> snapshot) {
          if (snapshot.hasData) {
            PageModel page = snapshot.data!;

            final List<Widget> _widgetOptions = [
              PageHomeContainer(
                pageModel: page,
              ),
              PageInfoContainer(
                page: page,
              ),
              PageProductContainer(
                textError: "${page.name} n'a pas encore insere de produits\n"
                    "svp verifiez plutard",
                uri:
                    '${dotenv.env['PRODUCT_URL']}/filterProductByPageId?pageId=${page.id!}',
              ),
              PagePostContainer(
                textError: "${page.name} n'a pas encore insere de posts\n"
                    "svp venez verifier plutard",
                url:
                    '${dotenv.env['POST_URL']}/filterPostByPageId?pageId=${page.id!}',
              ),
              PageJobsContainer(
                uri:
                    '${dotenv.env['JOB_URL']}/filterJobByPageId?pageId=${page.id!}',
                pageName: page.name!,
                height: 0.25,
              ),
            ];

            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: BackgroundImage(
                          imageUrl: page.imageUrl!,
                        ),
                      ),
                      AppBarWithReturn(
                        title: "",
                        color: Colors.transparent,
                        elevation: 0,
                      )
                    ],
                  ),
                  TransformedContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          page.name!,
                          style: detailTitleStyle,
                        ),
                        CustomInternNavigation(
                          menuItems: _menuItems,
                          widgetOptions: _widgetOptions,
                          verticalPadding: 0.0,
                          horizontalPadding: 0.0,
                          elevationValue: 0.0,
                          height: 0.05,
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
      ),
    );
  }
}
