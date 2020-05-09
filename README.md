# flutter_webviewe

<br>
<center> <font color=gray size=5  face="微软雅黑">Flutter webView的使用及与js交互</font></center >  

<br>
<br>
<text><font color=gray size=3  face="微软雅黑"></text>

对于Flutter开发,使用webView显示h5页面也是非常常见的，网上也有很多相关帖子，刚好最近接触了，这里对此做个总结。主要介绍下目前Flutter常用的**webView使用**，以及**与js的交互**。  

Flutter常见的webView插件:   
`webview_flutter` 和 `flutter_webview_plugin` 
在iOS中底层调用的是WKWebView，在Android中底层调用的是WebView。


<br>

><font color=gray size=4  face="微软雅黑">webview_flutter插件 的使用</font>

* 添加依赖
  ```dart
  dependencies:
  webview_flutter: ^0.3.21
  ```
* 拉取依赖库
  `flutter pub get`
* 导包
  `import 'package:webview_flutter/webview_flutter.dart';`

<br>
```dart
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
```


<br>

><font color=gray size=4  face="微软雅黑">flutter_webview_plugin插件 的使用</font>  


* 添加依赖
  ```dart
  dependencies:
  flutter_webview_plugin: ^0.3.11
  ```
* 拉取依赖库
  `flutter pub get`
* 导包
  `import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';`

<br>
```dart
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
```

`注意`：2个插件使用时，iOS需要在项目info.plist文件中加入如下配置

```
<key>io.flutter.embedded_views_preview</key>
        <true/>
```
这个不添加 h5页面加载不出来

```
<key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
    </dict>
```
如果是http协议，需要配置这个

<br>

><font color=gray size=4  face="微软雅黑">JS掉起Flutter互</font>  

做过原生webView交互的都知道，js和原生交互的处理方式，js掉起Flutter除了可以像js掉安卓、ios原生那样调用外，
* JS掉起原生
  js代码如下：
```java
 if (isIOS == false) {
    window.android.postStatus({
        message: "js调用了flutter",
    });
} else {
     window.webkit.messageHandlers.postStatus.postMessage({
        message: "js调用了flutter",
    });
}
```

还可以使用另外一种比较方便的方式调用。
```java
function postMessage() {
    postStatus.postMessage("message from JS...");
  }
```
postStatus就是方法名，传递的参数可以是字符串，数据多可以使用json字符串，切记 方法名必须和接收处一致。

本文示例中的html js交互采用的是原生方式，不过建议大家使用后面这种js调用方式，安卓和iOS都统一，省钱了判断平台的麻烦。

* Flutter代码写法
```dart
_jsCallNativeChannel() {
    return <JavascriptChannel>[
      _jsCallNativeJavascriptChannel(context),
    ].toSet();
  }

  _jsCallNativeJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: "postStatus",
        onMessageReceived: (JavascriptMessage message) {
          print("Js call native ： ${message.message}");
        });
  }
```
JavascriptChannel即一个js调用Flutter的通道，可以有多个通道。name是方法名，和js端对应，回调了一个 JavascriptMessage 对象，接收来自 JS 的回调信息。目前这里边只有一个 message(String) 属性。只支持 String 类型的参数，数据过多的话可以考虑 JSON 的 String 类型参数

本demo完整的代码已上传github，地址在下面

```
插件地址:  
https://pub.dev/packages?q=webview_flutter ;
https://pub.dev/packages/flutter_webview_plugin
本文源码： 
https://github.com/Qson8/flutter_webview_demo.git
```
