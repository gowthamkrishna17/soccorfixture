import 'package:flutter/material.dart';

class Livematch extends StatelessWidget {
  final String team1;
  final String team2;

  const Livematch({super.key, required this.team1, required this.team2});

  @override
  Widget build(BuildContext context) {
    print('Team : [$team1, $team2]'); // ✅ should print real names like [yy, kk]

    return Scaffold(
      appBar: AppBar(title: Text('Live Match')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Team 1: $team1'),
            Text('vs'),
            Text('Team 2: $team2'),
          ],
        ),
      ),
    );
  }
}
