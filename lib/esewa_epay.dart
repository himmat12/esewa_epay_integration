import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EsewaEpay extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<EsewaEpay> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  late WebViewController _webViewController;

  String testUrl = "https://pub.dev/packages/webview_flutter";

  _loadHTMLfromAsset() async {
    String file = await rootBundle.loadString("assets/epay_request.html");
    _webViewController.loadUrl(Uri.dataFromString(file,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _webViewController.evaluateJavascript(
                'requestPayment(tAmt = 1000, amt = 200, txAmt = 100, psc = 20, pdc = 10, scd = "EPAYTEST", pid = "1", su = "#", fu = "#")');
          });
        },
        child: Icon(Icons.add),
      ),
      body: WebView(
        initialUrl: "about:blank",
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: Set.from([
          JavascriptChannel(
            name: "message",
            onMessageReceived: (message) {},
          ),
        ]),
        onWebViewCreated: (webViewController) {
          // _controller.complete(webViewController);
          _webViewController = webViewController;
          _loadHTMLfromAsset();
        },
      ),
    );
  }
}
