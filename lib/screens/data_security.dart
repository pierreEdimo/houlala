import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/shared_widgets/custom_button_container.dart';
import 'package:houlala/shared_widgets/standard_custom_container.dart';
import 'package:houlala/shared_widgets/web_view_container.dart';

class DataSecurityScreen extends StatelessWidget {
  const DataSecurityScreen({super.key});

  Future<String> _loadAssset(BuildContext context) async {
    return await DefaultAssetBundle.of(context).loadString('texts/term.html');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        automaticallyImplyLeading: false,
        leading: CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.angleLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Politique de confidentialité'),
      ),
      body: StandardCustomContainer(
        child: FutureBuilder(
          future: _loadAssset(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
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
