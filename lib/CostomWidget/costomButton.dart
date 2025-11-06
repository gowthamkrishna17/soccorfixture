import 'package:flutter/material.dart';

class costomButton extends StatelessWidget {
  const costomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 250,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1),
        color: Colors.blueGrey,
      ),
      child: Center(child: const Text('Continue')),
    );
  }
}
