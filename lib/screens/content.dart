import 'package:flutter/material.dart';
import 'package:mi_card/constants/constants.dart';

class info extends StatefulWidget {
  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff464646),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'HEADLINE',
              style: ktextstyle,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[],
        ));
  }
}
