import 'package:flutter/material.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/markdown_container.dart';
import 'package:houlala/widget/standard_custom_container.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  Future<String> _loadAssset(BuildContext context) async {
    return await DefaultAssetBundle.of(context).loadString('texts/about.md');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithReturn(
        title: "A Propos",
        elevation: 1,
      ),
      body: StandardCustomContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: FutureBuilder(
            future: _loadAssset(context),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                String? data = snapshot.data;
                return MarkdownContainer(
                  data: data,
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
