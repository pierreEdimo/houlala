import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class WebViewContainer extends StatefulWidget {
  final String? html;

  const WebViewContainer({
    Key? key,
    this.html,
  }) : super(key: key);

  @override
  State<WebViewContainer> createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {

  @override
  Widget build(BuildContext context) {
    return WebViewPlus(
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) {
        controller.loadString(widget.html!);
      },
    );
  }
}
