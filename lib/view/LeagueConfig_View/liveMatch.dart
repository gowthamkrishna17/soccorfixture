import 'package:flutter/material.dart';

class Livematch extends StatelessWidget {
  const Livematch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(child: Row(children: [Text('real'), Text('Real')])),
          ],
        ),
      ),
    );
  }
}
