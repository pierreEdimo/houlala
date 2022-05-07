import 'package:flutter/material.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/markdown_container.dart';
import 'package:houlala/widget/standard_custom_container.dart';

class ConditionScreen extends StatelessWidget {
  const ConditionScreen({Key? key}) : super(key: key);

  Future<String> _loadAssset(BuildContext context) async {
    return await DefaultAssetBundle.of(context)
        .loadString('texts/condition.md');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithReturn(
        title: "Conditions d'utilisation",
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
