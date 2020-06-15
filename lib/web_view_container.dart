import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:loanapp/MoreOptions/rate_us.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart';
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
  // Completer<WebViewController> _controller = Completer<WebViewController>();
  final key = GlobalKey<ScaffoldState>();
  _WebViewContainerState(this._url);

  @override
  void initState() {
    super.initState();
    _isLoadingPage = false;
  }

  @override
  Widget build(BuildContext context) {
//    WebViewController _webViewController;

    return Scaffold(
      key: key,
      appBar: AppBar(
        title: new Text('Loan Kwik'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () async {
            if (await _confirmExit()) Navigator.pop(context);
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: _confirmExit,
        child: Container(
            child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: InAppWebView(
                  key: _key,
                  initialUrl: _url,
                  initialHeaders: {},
                  onWebViewCreated:
                      (InAppWebViewController inAppWebViewController) {
                    webview = inAppWebViewController;
                  },
                  onLoadStart:
                      (InAppWebViewController controller, String url) async {
                    //  print('Loading...****************************');
                    // setState( () {
                    //   _isLoadingPage = true;
                    // } );

                    key.currentState.showSnackBar(SnackBar(
                      content: Text('Loading please wait...'),
                      backgroundColor: lightBlueColor,
                    ));

                    // if(await canLaunch(url)) {
                    //     await launch(url);
                    //   }else{
                    //     throw 'Could not launch $url';
                    //   }
                  },
                  onLoadStop: (InAppWebViewController controller, String url) {
                    //    print('Loaded !***************************************************************************');
                    // setState( () {
                    //   _isLoadingPage = false;
                    // } );
                  },
                  onLoadError: (InAppWebViewController controller, String url,
                      int index, String error) async {
                    key.currentState.showSnackBar(SnackBar(
                      content: Text('Redirecting .....'),
                      backgroundColor: lightBlueColor,
                    ));
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  Future<bool> _confirmExit() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text(
              'Confirmation',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            content: new Text('Do you want to exit ?'),
            actions: <Widget>[
              new Row(
                children: <Widget>[
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text("NO", style: TextStyle(color: Colors.grey)),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 10),
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text("YES", style: TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
            ],
          ),
        ) ??
        false;
  }
}
