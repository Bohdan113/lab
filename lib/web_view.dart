import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OpenWebViewScreen extends StatelessWidget {
  const OpenWebViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: WebView(
        initialUrl: 'https://nung.edu.ua',
      ),
    );
  }
}
