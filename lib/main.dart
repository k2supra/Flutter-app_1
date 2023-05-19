import 'package:flutter/material.dart';

import 'Internal/Config.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      home: Config(key: UniqueKey()),
    );
  }
}
