import 'dart:io';

import 'package:flutter/material.dart';
import '../Presentation/Screen/home.dart';
import '../Presentation/Screen/college_screen.dart';
import '../Presentation/Screen/hobby_screen.dart';

class Config extends StatefulWidget {
  const Config({required Key key}) : super(key: key);

  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Biography",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Biography"),
          leading: const Icon(Icons.emoji_emotions),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {exit(0);},
            ),
          ],
        ),
        body: Home(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Me',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'College',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.golf_course),
              label: 'Hobbies',
            ),
          ],
          selectedItemColor: Color(0xFF0AB9BF),
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });

            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CollegeScreen()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HobbyScreen()),
              );
            }
          },
        ),
      ),
    );
  }
}
