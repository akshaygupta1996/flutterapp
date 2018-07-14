import 'dart:async';

import 'package:add_just/discover.dart';
import 'package:add_just/profile.dart';
import 'package:add_just/widgets/draweritem.dart';
import 'package:add_just/widgets/projects.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  double startCoordinate;
  double endCoordinate;
  int _currentIndex = 0;
  BottomNavigationBarType _type = BottomNavigationBarType.shifting;
  List<NavigationIconView> _navigationViews;

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: new ImageIcon(new AssetImage('assets/dashboard.png')),
        title: 'PROJECTS',
        content: new ProjectsPage(),
        color:  Colors.grey,
        vsync: this,
      ),
      new NavigationIconView(
        icon: new ImageIcon(new AssetImage('assets/discover.png')),
        title: 'DISCOVER',
        color: Colors.grey,
        content: new DiscoverPage(),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new ImageIcon(new AssetImage('assets/profile.png')),
        title: 'PROFILE',
        content: new ProfilePage(),
        color: Colors.grey,
        vsync: this,
      )
    ];

    for (NavigationIconView view in _navigationViews)
      view.controller.addListener(_rebuild);

    _navigationViews[_currentIndex].controller.value = 1.0;
  }

  @override
  void dispose() {
    for (NavigationIconView view in _navigationViews) view.controller.dispose();
    super.dispose();
  }

  void _rebuild() {
    setState(() {});
  }

  void _tabChangeListener(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _onDragStart(BuildContext context, DragStartDetails start, int cIndex) {
    RenderBox getBox = context.findRenderObject();
    var local = getBox.globalToLocal(start.globalPosition);
    print(local.dx.toString() + "|" + local.dy.toString());
    startCoordinate = double.parse(local.dx.toString());
  }

  _onDragUpdate(BuildContext context, DragUpdateDetails update, cIndex) {
    RenderBox getBox = context.findRenderObject();
    var local = getBox.globalToLocal(update.globalPosition);
    print(local.dx.toString() + "|" + local.dy.toString());
    endCoordinate = double.parse(local.dx.toString());
  }

  _onDragEnd(BuildContext context, DragEndDetails end, cIndex) {
    if (endCoordinate < startCoordinate) {
      print(cIndex);
      if (cIndex != 2) {
        setState(() {
          print("SET CHANGED");
          _currentIndex = cIndex + 1;
        });
        _tabChangeListener(_currentIndex);
      }
    } else if (endCoordinate > startCoordinate) {
      print(cIndex);
      if (cIndex != 0) {
        setState(() {
          print("STATE CHANGED");
          _currentIndex = cIndex - 1;
        });

        _tabChangeListener(_currentIndex);
      }
    }
  }

  Future<bool> _onWillPop() async {
    if (_currentIndex == 0) {
      return true;
    } else {
      _tabChangeListener(0);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: _type,
      onTap: (int index) {
        _tabChangeListener(index);
      },
    );

    return WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(


        drawer:  Drawer(
          elevation: 1.0,
          child: new Container(

            color: Colors.black54,
            child: new Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: <Widget>[


                new Padding(padding: new EdgeInsets.only(top: 60.0)),

              new Padding(
                    padding: new EdgeInsets.only(left: 42.0, top: 9.0, bottom: 9.0),
                    child: new Text("Dublin City Council", style: new TextStyle(color: Colors.blue, fontSize: 18.0, letterSpacing: 2.0), ),
                ),

                new Padding(
                  padding: new EdgeInsets.only(left: 42.0, top: 9.0, bottom: 2.0),
                  child: new Text("Welcome", style: new TextStyle(color: Colors.white30, fontSize: 16.0, letterSpacing: 2.0), ),
                ),

                new Padding(
                  padding: new EdgeInsets.only(left: 42.0, top: 4.0, bottom: 9.0),
                  child: new Text("XYZ", style: new TextStyle(color: Colors.white30, fontSize: 18.0, letterSpacing: 2.0), ),
                ),

                new DrawerItem("Projects"),
                new DrawerItem("Calendar"),

                new Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 9.0, bottom: 9.0),
                  child: new Divider(height: 2.0, color: Colors.white30,),
                ),
                new DrawerItem("Profile"),
                new DrawerItem("Change Password"),

                new Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 9.0, bottom: 9.0),
                  child: new Divider(height: 2.0, color: Colors.white30,),
                ),
                new GestureDetector(

                    onTap: (){


                      Navigator.pushNamed(context, "/about");


                    },
                    child: new DrawerItem("About")),
                new GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, "/help");



                    },
                    child: new DrawerItem("Help")),
                new GestureDetector(

                  onTap: (){

                    Navigator.pushNamed(context, "/contactus");

                  },
                    child: new DrawerItem("Contact Us")),
                new GestureDetector(

                  onTap: (){


                    Navigator.pushNamed(context, "/termsofservice");



                  },
                    child: new DrawerItem("Terms Of Service")),


                new Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 9.0, bottom: 9.0),
                  child: new Divider(height: 2.0, color: Colors.white30,),
                ),
                new GestureDetector(

                  onTap: (){


                    Navigator.pushReplacementNamed(context, "/login");
                  },
                    child: new DrawerItem("Log Out"))

              ],

            ),
          ),


        ),
        appBar:  new AppBar(
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
        body: new GestureDetector(
          child:  new Container(
            height: double.infinity,
            width: double.infinity,
            child: _navigationViews[_currentIndex].content,
          ),
          onHorizontalDragStart: (DragStartDetails start) =>
              _onDragStart(context, start, _currentIndex),
          onHorizontalDragUpdate: (DragUpdateDetails update) =>
              _onDragUpdate(context, update, _currentIndex),
          onHorizontalDragEnd: (DragEndDetails end) =>
              _onDragEnd(context, end, _currentIndex),
        ),
        bottomNavigationBar: botNavBar,
      ),
    );
  }
}

class NavigationIconView {
  NavigationIconView({
    Widget icon,
    String title,
    Widget content,
    Color color,
    TickerProvider vsync,
  })  : _icon = icon,
        _content = content,
        _color = color,
        _title = title,
        item = new BottomNavigationBarItem(
            icon: icon,
            title: new Text(
              title,
              style: new TextStyle(fontFamily: 'Lato', fontSize: 14.0),
            ),
            backgroundColor: color),
        controller = new AnimationController(
          duration: kThemeAnimationDuration,
          vsync: vsync,
        ) {
    _animation = new CurvedAnimation(
      parent: controller,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
  }

  final Widget _icon;
  final Widget _content;
  final Color _color;
  final String _title;
  final BottomNavigationBarItem item;
  final AnimationController controller;
  CurvedAnimation _animation;

  get content => _content;

  FadeTransition transition(
      BottomNavigationBarType type, BuildContext context) {
    Color iconColor;
    if (type == BottomNavigationBarType.shifting) {
      iconColor = _color;
    } else {
      final ThemeData themeData = Theme.of(context);
      iconColor = themeData.brightness == Brightness.light
          ? themeData.primaryColor
          : themeData.accentColor;
    }

    return new FadeTransition(
      opacity: _animation,
      child: new SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(0.0, 0.02), // Slightly down.
          end: Offset.zero,
        ).animate(_animation),
        child: new IconTheme(
          data: new IconThemeData(
            color: iconColor,
            size: 120.0,
          ),
          child: new Semantics(
            label: 'Placeholder for $_title tab',
            child: _icon,
          ),
        ),
      ),
    );
  }
}
