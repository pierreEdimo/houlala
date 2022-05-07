import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkdownContainer extends StatelessWidget {
  final String? data;

  const MarkdownContainer({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Markdown(
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      data: data!,
      onTapLink: (text, uri, title){
        Uri url = Uri.parse(uri!);
        launchUrl(url);
      },
      styleSheet: MarkdownStyleSheet(
          h1: const TextStyle(
              fontWeight: FontWeight.bold, fontFamily: 'PoppinsBold'),
          h2: const TextStyle(
            fontFamily: 'PoppinsBold',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
