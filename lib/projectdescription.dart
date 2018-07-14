

import 'package:flutter/material.dart';

class ProjectDescription extends StatefulWidget {

  String projectTitle;

  ProjectDescription(this.projectTitle);
  @override
  _ProjectDescriptionState createState() => _ProjectDescriptionState(projectTitle);
}

class _ProjectDescriptionState extends State<ProjectDescription> {


  String projectTitle;

  _ProjectDescriptionState(this.projectTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  new AppBar(
        centerTitle: true,
        title:  Text(
          projectTitle,
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
