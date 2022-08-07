import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mi_card/constants/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class info extends StatefulWidget {
  String blogurl;

  info({this.blogurl});

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  Completer<WebViewController> completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff464646),
        appBar: AppBar(
          actions: <Widget>[
            Opacity(
                opacity: 0,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(
                      Icons.share,
                    ))),
          ],
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'HEADLINE',
              style: ktextstyle,
            ),
          ),
        ),
        body: Container(
          child: WebView(
            initialUrl: widget.blogurl,
            onWebViewCreated: ((WebViewController webViewController) {
              completer.complete(webViewController);
            }),
          ),
        ));
  }
}
