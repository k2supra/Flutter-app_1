import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<Map<String, dynamic>> me = [
    {'emoji': Icons.person, 'text': 'Name: Andrew'},
    {'emoji': Icons.calendar_today, 'text': 'Age: 16'},
  ];
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var m in me)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(m['emoji']),
                  ),
                  const SizedBox(width: 8,),
                  Text(m['text']),
                ],
              ),
              Image.asset("assets/image/mee.jpg"),
            //Image(image: AssetImage('assets/image/mee.jpg')),
          ],
          
        ),
      )
    );
  }
}