


import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  new AppBar(
        centerTitle: true,
        title:  Text(
          "Help",
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
