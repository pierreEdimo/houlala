import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:houlala/widget/display_dialog.dart';
import 'package:launch_review/launch_review.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_launch/flutter_launch.dart';

void openContact(String scheme, String path) async {
  final Uri uri = Uri(
    scheme: scheme,
    path: path,
  );
  await launchUrl(uri);
}

Future<void> openInWebViewOrVC(String uri) async {
  final Uri url = Uri.parse(uri);
  if (!await launchUrl(
    url,
    mode: LaunchMode.inAppWebView,
    webViewConfiguration: const WebViewConfiguration(
        headers: <String, String>{'my_header_key': 'my_header_value'}),
  )) {
    throw 'Could not launch $url';
  }
}

openWhatsapp(BuildContext context) async {
  bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");

  if (whatsapp) {
    await FlutterLaunch.launchWhatsapp(
        phone: "+491785171780", message: "Bonjour");
  } else {
    showErrorDialog(context, "Erreur",
        "Nous n'arrivons pas a nous connecter sur  Whatsapp, verifiez si vous avez installer l'application et reesayez plutard");
  }
}

openStore(BuildContext context) {
  try {
    LaunchReview.launch();
  } on MissingPluginException catch (e) {
    showErrorDialog(context, "Erreur",
        "Nous n'arrivons pas a nous connecter sur  Whatsapp, verifiez si vous avez installer l'application et reesayez plutard");
  }
}