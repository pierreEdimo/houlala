import 'package:url_launcher/url_launcher.dart';

void openContact(String scheme, String path) async {
  final Uri uri = Uri(
    scheme: scheme,
    path: path,
  );
  if (!await launchUrl(uri)) throw 'Could not launch $uri';
}
