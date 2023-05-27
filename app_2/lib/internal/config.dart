import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../presentation/home.dart';

class Config extends StatefulWidget {
  const Config({required Key key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  int curretIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet adoption',
      themeMode: ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          //shadowColor: Colors.white,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () {null;}, 
              child: const Text('Skip >'),
              )
          ],
        ),
        extendBodyBehindAppBar: true,
        body: const Home(),
      ),
    );
  }
}