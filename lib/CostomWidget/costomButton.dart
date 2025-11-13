import 'package:flutter/material.dart';

class costomButton extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final Color color;
  const costomButton({
    super.key,
    this.color = Colors.blueGrey,
    this.height = 40,
    this.width = 250,
    this.title = 'Continue',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1),
        color: color,
      ),
      child: Center(child: Text(title)),
    );
  }
}
