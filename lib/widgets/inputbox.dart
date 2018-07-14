import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final String hint;

  InputBox({this.hint});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50.0,
      width: 300.0,
      margin:  EdgeInsets.all(5.0),
      padding:  EdgeInsets.only(left: 10.0),
      alignment: Alignment.center,
      color: Colors.white,
      child:  TextFormField(
        decoration:  InputDecoration(
          hintText: hint,
          hintStyle:  TextStyle(
              fontSize: 18.0,
              color:  Color.fromRGBO(0, 153, 145, 1.0),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w100),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
