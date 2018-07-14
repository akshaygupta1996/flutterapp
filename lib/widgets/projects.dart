

import 'dart:convert';

import 'package:add_just/projectdescription.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatefulWidget {
  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {





  final String projects_json = '{  "projects":[  {"name": "Project 1"}, {"name": "Project 2"}, {"name": "Project 3"}, {"name": "Project 4"}]  }';


  List<Widget> projectList = new List();


  @override
  Widget build(BuildContext context) {

    Map json = JSON.decode(projects_json);

    for(var p in json['projects']){

      projectList.add(new Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
        child: new GestureDetector(
          onTap:(){


            Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new ProjectDescription(p['name'])),
            );
          },
          child: new Card(
            elevation: 2.0,
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.all(new Radius.circular(1.0))),

            child: new Container(
              height: 50.0,
              alignment: Alignment.center,
              width: double.infinity,

              child: new Text(p["name"], style: new TextStyle(fontSize: 22.0, fontFamily: 'Lato'),),
            ),
          ),
        ),
      ));
    }


    return Container(


      color: new Color.fromRGBO(242, 242, 242, 1.0),


    child: new ListView(


        children: projectList
      ),


    );
  }
}
