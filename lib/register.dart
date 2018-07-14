import 'package:flutter/material.dart';

import 'package:add_just/widgets/inputbox.dart';
import 'package:add_just/widgets/draweritem.dart';



class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

          drawer:  Drawer(
            elevation: 1.0,
            child: new Container(

              color: Colors.black54,
              child: new Column(

                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: <Widget>[


                  new Padding(padding: new EdgeInsets.only(top: 100.0)),

                  new DrawerItem("About"),
                  new DrawerItem("Help"),

                  new Padding(
                    padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 9.0, bottom: 9.0),
                    child: new Divider(height: 2.0, color: Colors.white30,),
                  ),
                  new DrawerItem("Contact Us"),
                  new DrawerItem("Terms Of Service"),

                  new Padding(
                    padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 9.0, bottom: 9.0),
                    child: new Divider(height: 2.0, color: Colors.white30,),
                  ),
                  new DrawerItem("Log In")




                ],

              ),
            ),


          ),
          backgroundColor: Color.fromRGBO(242, 242, 242, 1.0),
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  '+Add',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w300),
                ),
                const Text('Just',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                    )),
              ],
            ),
            backgroundColor: const Color.fromRGBO(217, 217, 217, 1.0),
            elevation: 0.0,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 35.0, bottom: 12.0),
                  child: const Text(
                    'Welcome',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        letterSpacing: 0.2,
                        fontWeight: FontWeight.w100),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 35.0),
                  child: const Text(
                    'Please fill few details to get started.',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 11.0,
                        //letterSpacing: 0.8,
                        fontWeight: FontWeight.w200),
                  ),
                ),
                InputBox(
                  hint: "Company Name",
                ), //Company
                InputBox(
                  hint: "Your Name",
                ), //Name
                InputBox(
                  hint: "Email",
                ), //Email
                InputBox(hint: "Choose Password"), //Password

                new GestureDetector(
                  onTap: (){


                    Navigator.pushReplacementNamed(context, "/login");


                  },
                  child: Container(
                      height: 50.0,
                      width: 300.0,
                      margin: EdgeInsets.only(top: 20.0, bottom: 30.0),
                      padding: EdgeInsets.only(left: 10.0),
                      alignment: Alignment.center,
                      color: Color.fromRGBO(0, 153, 145, 1.0),
                      child: Text(
                        "Let's get started",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            letterSpacing: -0.9),
                      )),
                ),
                const Text(
                  'Already have an account?',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.w100),
                ),
                new GestureDetector(
                  onTap: (){


                    Navigator.pushReplacementNamed(context, "/login");

                  },
                  child: const Text(
                    'Log In here.',
                    style: const TextStyle(
                        color: const Color.fromRGBO(0, 153, 145, 1.0),
                        fontSize: 18.0,
                        letterSpacing: -0.9,
                        fontWeight: FontWeight.w200),
                  ),
                ),
              ],
            ),
          )),
    );
  }


}
