import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  const WebViewPage({super.key, required this.url});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final StreamController<double> stream;
  late WebViewController webController;

  @override
  void initState() {
    super.initState();
    stream = StreamController<double>();
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            stream.sink.add(progress * 0.01);
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  void dispose() {
    stream.close();
    webController.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          WebViewWidget(
            controller: webController,
          ),
          StreamBuilder<double>(
              stream: stream.stream,
              builder: (context, snapshot) {
                return LinearProgressIndicator(
                  value: snapshot.data,
                  semanticsLabel: 'Linear progress indicator',
                  color: Colors.black,
                );
              }),
        ],
      ),
    ));
  }
}
