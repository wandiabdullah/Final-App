import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import '../pages/home.dart';
//import 'package:newsappproject/services/authentication.dart';
//import 'package:firebase_database/firebase_database.dart';
import '../config.dart';
import '../services/theme_changer.dart';
import '../tabs/categories_tab.dart';
import '../tabs/home_tab.dart';
//import '../models/todo.dart';
import 'root_page.dart';
import '../tabs/login.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(TITLE),
        titleSpacing: 8.0,
        actions: <Widget>[
          GestureDetector(
            child: Icon(Icons.lightbulb_outline),
            onTap: themeChanger.toggle,
          )
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: <Widget>[
          HomeTab(),
          CategoriesTab(),
          Login(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            title: Text('Account'),
          ),
        ],
      ),
    );
  }
}
