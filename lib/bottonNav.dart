import 'package:flutter/material.dart';
import 'package:project_1/bookMark.dart';
import 'package:project_1/homepage.dart';
import 'package:project_1/profle.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentState = 0;

  var pages = [
    HomePage(),
    BookMark(),
    Profile(),
  ];

  void _onChange(int index) {
    setState(
      () {
        _currentState = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.green[400],
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.bookmarks_outlined),
            title: Text("Bookmark"),
            selectedColor: Colors.pink[100],
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person_pin),
            title: Text("Profile"),
            selectedColor: Colors.blue[200],
          ),
        ],
        onTap: _onChange,
        currentIndex: _currentState,
      ),
      body: SafeArea(child: pages[_currentState]),
    );
  }
}
