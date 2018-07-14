

import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  new AppBar(
        centerTitle: true,
        title:  Text(
          "About",
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
