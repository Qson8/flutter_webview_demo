import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Webview2 extends StatelessWidget {
  final String url;
  final Set<JavascriptChannel>  javascriptChannels;

  const Webview2({Key key, this.url, this.javascriptChannels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebviewScaffold(
        url: url,
        withJavascript: true,
        supportMultipleWindows: true,
        withLocalStorage: true,
        javascriptChannels: javascriptChannels,
      ),
    );
  }
}
