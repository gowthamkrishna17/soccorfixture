import 'package:flutter/cupertino.dart';

class Leaguevm extends ChangeNotifier {
  final List<List<String>> _leagueFixture = [];
  List<List<String>> get LeagueFixture => _leagueFixture;

  void generateFixture(List<String> teams) {
    _leagueFixture.clear();
    for (int i = 0; i < teams.length; i++) {
      for (int j = i + 1; j < teams.length; j++) {
        _leagueFixture.add([teams[i], teams[j]]);
      }
    }
    notifyListeners();
  }

  void clearFix() {
    _leagueFixture.clear();
    notifyListeners();
  }
}
