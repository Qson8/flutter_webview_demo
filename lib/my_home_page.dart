import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webviewe/webview_page1.dart';
import 'package:flutter_webviewe/webview_page2.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('webview的使用和js交互')),
      body: _widgetBody(),
    );
  }

  _widgetBody() {
    return Center(
      child: Column(
        children: <Widget>[
          MaterialButton(
            onPressed: () {
              pushWidget(context, WebviewPage1());
            },
            child: Text('使用webview_flutter'),
          ),
          MaterialButton(
            onPressed: () {
              pushWidget(context, WebviewPage2());
            },
            child: Text('使用flutter_webview_plugin'),
          ),
        ],
      ),
    );
  }

  static void pushWidget(context, widget) {
    Navigator.of(context).push(new CupertinoPageRoute(builder: (ctx) {
      return widget;
    }));
  }
}
