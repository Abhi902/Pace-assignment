import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mi_card/constants/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class info extends StatefulWidget {
  String blogurl;
  String headline;
  String content;
  String source;
  DateTime published;

  info(
      {this.blogurl, this.source, this.content, this.published, this.headline});

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  Completer<WebViewController> completer = Completer<WebViewController>();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff464646),
      body: Container(
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                Expanded(
                  child: Image.network(
                    "${widget.blogurl}",
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                elevation: 2.0,
                fillColor: Colors.black26.withOpacity(0.2),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
            ),
            Positioned(
              top: 480,
              left: 20,
              child: Text(
                '${widget.source}',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    color: Colors.white),
              ),
            ),
            Positioned(
              top: 300,
              left: 20,
              right: 20,
              bottom: 30,
              child: Text(
                "${widget.headline}",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    color: Colors.white,
                    letterSpacing: 1),
              ),
            ),
            Positioned(
              top: 480,
              left: 150,
              right: 20,
              child: Text(
                '${widget.published}',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'RobotoSlab',
                    fontSize: 14,
                    color: Color(0xfff2f2f2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 580, left: 20, right: 20),
              child: Positioned(
                top: 540,
                left: 20,
                child: Text(
                  '${widget.content}',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: 'RobotoSlab',
                      fontSize: 14,
                      color: Color(0xffbababa)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
