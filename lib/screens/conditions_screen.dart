import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/widget/custom_button_container.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.angleLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Conditions d'utilisation"),
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
