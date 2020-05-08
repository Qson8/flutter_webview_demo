import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_webviewe/webview2_view.dart';

const String baseUrl = 'https://www.yundouv.com/a.html';
const String postStatus = 'postStatus';

/*
 *  flutter_webview_plugin 的使用和js交互
*/
class WebviewPage2 extends StatefulWidget {
  @override
  _WebviewPage2State createState() => _WebviewPage2State();
}

class _WebviewPage2State extends State<WebviewPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('flutter_webview_plugin'),
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
    return Webview2(
      url: baseUrl,
      javascriptChannels: _jsCallNativeChannel(),
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
