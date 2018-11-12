import 'package:classify_home/tasks.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.teal
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          new Image(image: new AssetImage("assets/filledlogo.png"),
          ),
        ],
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient( begin: Alignment.topRight,
              end: Alignment.bottomLeft,
                stops: [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    Colors.teal[900],
                    Colors.teal[700],
                    Colors.teal[500],
                    Colors.teal[300],
                  ])
          )
        ),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Jon Holden"),
              accountEmail: new Text("jon@classify.org.uk"),
              currentAccountPicture: new CircleAvatar(
                new Image(image: new AssetImage("profilepicjonexample.jpg")),
                child: new Text("J"),
              )
            ),
            new ListTile(
              title: new Text("Page One"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new TaskPage("Page One")));
              }
            ),
            new ListTile(
              title: new Text("Page Two"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new TaskPage("Page Two")));
              }
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
              onTap: ()=> Navigator.of(context).pop(),
            ),
          ]
        )
      ),
      body: new Container(
        child: new Center(
          child: new Text("Welcome back, Jon.")
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.note),
            title: new Text("Notes"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.alarm),
            title: new Text("Tasks"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.calendar_today),
            title: new Text("Timetable"),
          ),
        ]
      ),
    );
  }
}
