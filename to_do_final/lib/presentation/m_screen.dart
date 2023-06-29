import 'package:flutter/material.dart';
import 'package:to_do_final/presentation/home.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Column(
        children: [
          const Text('Main screen'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => const Home())));
              //Navigator.pushReplacementNamed(context, '/to_do');
            }, 
            child: const Text('Next'),
          )
        ],
      )
    );
  }
}