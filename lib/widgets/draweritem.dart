


import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {


  String title;


  DrawerItem(this.title);
  @override
  Widget build(BuildContext context) {
    return  new Padding(
      padding: new EdgeInsets.only(left: 42.0, top: 9.0, bottom: 9.0),
      child: new Text(title.toString(), style: new TextStyle(color: Colors.white, fontSize: 16.0, letterSpacing: 2.0), ),

    );
  }
}

