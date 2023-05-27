import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(
        width: 500,
        image: NetworkImage('https://publish.purewow.net/wp-content/uploads/sites/2/2021/06/smallest-dog-breeds-toy-poodle.jpg?fit=728%2C524'),
      ),
    );
  }
}