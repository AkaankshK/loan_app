import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  WebViewPage({Key key,this.url}) : super(key: key);
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apply"),
      ),
      body:WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "https://play.google.com/store/apps/details?id=com.csam.icici.bank.imobile&hl=en",
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
      ),
    );
  }
}
