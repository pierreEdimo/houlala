import 'package:flutter/material.dart';

class WebViewContainer extends StatefulWidget {
  final String? html;

  const WebViewContainer({
    super.key,
    this.html,
  });

  @override
  State<WebViewContainer> createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  @override
  Widget build(BuildContext context) {
    return const Text('test');
  }
}
