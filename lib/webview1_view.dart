import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview1 extends StatelessWidget {
final String url;
final  javascriptChannels1;

  const Webview1({Key key, this.url,this.javascriptChannels1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
      javascriptChannels: javascriptChannels1,
      gestureNavigationEnabled: true,
    ),
    );
  }
}