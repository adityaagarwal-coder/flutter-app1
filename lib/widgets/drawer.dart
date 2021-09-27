import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepOrange,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    accountName: Text("Aditya Agarwal"),
                    accountEmail: Text("aditya"))),
            ListTile(
                leading: Icon(CupertinoIcons.home, color: Colors.white),
                title: Text("Home",
                    style: TextStyle(color: Colors.white),
                    textScaleFactor: 1.5))
          ],
        ),
      ),
    );
  }
}
