import 'package:flutter/material.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:houlala/widget/web_view_container.dart';

class ConditionScreen extends StatelessWidget {
   const ConditionScreen({Key? key}) : super(key: key);

   Future<String> _loadAssset(BuildContext context) async {
     return await DefaultAssetBundle.of(context).loadString('texts/conditions.html');
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithReturn(
        title: "Conditions d'utilisation",
        elevation: 1,
        color: Colors.transparent,
      ),
      body:  StandardCustomContainer(
        child: FutureBuilder(
          future: _loadAssset(context),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
              String? data = snapshot.data;
              return WebViewContainer(
                html: data,
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
