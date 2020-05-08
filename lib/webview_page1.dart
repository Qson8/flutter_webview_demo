import 'package:flutter/material.dart';
import 'package:flutter_webviewe/webview1_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String baseUrl = 'https://www.yundouv.com/a.html';
const String postStatus = 'postStatus';

/*
 *  webview_flutter 的使用和js交互
*/
class WebviewPage1 extends StatefulWidget {
  @override
  _WebviewPage1State createState() => _WebviewPage1State();
}

class _WebviewPage1State extends State<WebviewPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('webview_flutter'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
      body: _widgetBody(),
    );
  }

  _widgetBody() {
    return Webview1(
      url: baseUrl,
      javascriptChannels1: _jsCallNativeChannel(),
    );
  }

  _jsCallNativeChannel() {
    return <JavascriptChannel>[
      _jsCallNativeJavascriptChannel(context),
    ].toSet();
  }

  _jsCallNativeJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: postStatus,
        onMessageReceived: (JavascriptMessage message) {
          print("Js call native ： ${message.message}");
        });
  }
}
