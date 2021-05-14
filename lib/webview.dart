import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatefulWidget {
  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    String testUrl = "https://pub.dev/packages/webview_flutter";
    String redirectUrl =
        "http://merchant.com.np/page/esewa_payment_success?q=su&oid=ee2c3ca1-696b-4cc5-a6be-2c40d929d453&amt=100&refId=000AE01";
    return WebView(
      initialUrl: "$testUrl",
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
    );
  }
}
