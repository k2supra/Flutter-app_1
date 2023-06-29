import 'package:flutter/material.dart';
import 'package:to_do_final/presentation/home.dart';
import 'package:to_do_final/presentation/m_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
	await Firebase.initializeApp();

  runApp(MaterialApp(
		theme: ThemeData(
			primaryColor: Colors.yellow,
		),
		initialRoute: '/',
		routes: {
			'/': (context) => MainScreen(),
			'/to_do': (context) => Home(),
		},
	));
}

/*void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.yellow
  ),
  initialRoute: '/',
  routes: {
    '/': (context) => const MainScreen(),
    '/to_do': (context) => const Home(),
  },
));*/
