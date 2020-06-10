import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
//import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {

  final url;
  WebViewContainer(this.url);
  @override
  _WebViewContainerState createState() => _WebViewContainerState(this.url);
}



class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  final _key = UniqueKey();
  bool _isLoadingPage;
  InAppWebViewController webview;
//  Completer<WebViewController> _controller = Completer<WebViewController>();

  _WebViewContainerState(this._url);

  @override
  void initState() {
    super.initState();
    _isLoadingPage = true;
  }




  @override
  Widget build(BuildContext context) {

//    WebViewController _webViewController;

    return Scaffold(
      appBar: AppBar(
        title: new Text('Loan Kwik'),
        centerTitle: true,
      ),
      body: Container(
       child: Column(
         children: <Widget>[
           Expanded(
             child: Container(
               child: InAppWebView(
                 initialUrl: _url,
                 initialHeaders: {},

                 onWebViewCreated: (InAppWebViewController inAppWebViewController) {
                   webview = inAppWebViewController;
                 },
                 onLoadStart: (InAppWebViewController controller, String url) {

                 },
                 onLoadStop: (InAppWebViewController controller, String url) {

                 },

               ),
             ),
           )
         ],
        )
        ),
//      body: Stack(
//        children: <Widget>[
//          new WebView(
//
//            key: _key,
//            initialUrl: _url,
//            javascriptMode: JavascriptMode.unrestricted,
//            onWebViewCreated: (WebViewController webviewController) {
//              _controller.complete(webviewController);
//            },
//            onPageFinished: (finish) {
//              setState(() {
//                _isLoadingPage = false;
//              });
//            },
//          ),
//          if(_isLoadingPage)
//               Container(
//                 alignment: FractionalOffset.center,
//                 child: CircularProgressIndicator(semanticsLabel: 'Loading....',),
//              )
////              : Container(
////            color: Colors.transparent,
////          ),
//        ],
//      ),
    );
  }
}




