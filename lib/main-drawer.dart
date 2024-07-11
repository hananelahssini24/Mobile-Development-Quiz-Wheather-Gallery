import 'package:flutter/material.dart';
import './weather.dart';
import './quiz.dart';
import 'camera.dart';
import 'gallery.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        DrawerHeader(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.orange, Colors.white])),
            child: Center(
                child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/logo.jpg'),
            ))),
        ListTile(
          title: Text('Quiz', style: TextStyle(fontSize: 18)),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Quiz()));
          },
        ),
        Divider(),
        ListTile(
          title: Text('Weather', style: TextStyle(fontSize: 18)),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Weather()));
          },
        ),
        Divider(),
        ListTile(
          title: Text('Gallery', style: TextStyle(fontSize: 18)),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Gallery()));
          },
        ),
        Divider(),
        ListTile(
          title: Text('Camera', style: TextStyle(fontSize: 18)),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Camera()));
          },
        ),
      ],
    ));
  }
}
