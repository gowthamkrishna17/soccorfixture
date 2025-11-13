import 'package:flutter/widgets.dart';

class Matchdata {
  String team1;
  String team2;
  int goal1;
  int goal2;
  List<TextEditingController> scorer1;
  List<TextEditingController> scorer2;
  Matchdata({
    required this.team1,
    required this.team2,
    this.goal1 = 0,
    this.goal2 = 0,
    List<TextEditingController>? scorer1,
    List<TextEditingController>? scorer2,
  }) : scorer1 = scorer1 ?? [],
       scorer2 = scorer2 ?? [];
}
