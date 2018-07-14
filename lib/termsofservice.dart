


import 'package:flutter/material.dart';

class TermsOfServicePage extends StatefulWidget {
  @override
  _TermsOfServicePageState createState() => _TermsOfServicePageState();
}

class _TermsOfServicePageState extends State<TermsOfServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  new AppBar(
        centerTitle: true,
        title:  Text(
          "Terms Of Service",
          style: const TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.w300),
        ),
        backgroundColor: const Color.fromRGBO(217, 217, 217, 1.0),
        elevation: 0.0,
      ),
      body: new Container(),
    );  }
}
