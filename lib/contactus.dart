



import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  new AppBar(
        centerTitle: true,
        title:  Text(
          "Contact Us",
          style: const TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.w300),
        ),
        backgroundColor: const Color.fromRGBO(217, 217, 217, 1.0),
        elevation: 0.0,
      ),
      body: new Container(),
    );
  }
}
