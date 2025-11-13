import 'package:flutter/cupertino.dart';

class Leaguevm extends ChangeNotifier {
  final List<List<String>> _leagueFixture = [];
  List<List<String>> get LeagueFixture => _leagueFixture;

  void generateFixture(List<String> teams) {
    _leagueFixture.clear();
    team1Goal.clear();
    team2Goal.clear();
    goalscorer1.clear();
    goalscorer2.clear();
    for (int i = 0; i < teams.length; i++) {
      for (int j = i + 1; j < teams.length; j++) {
        _leagueFixture.add([teams[i], teams[j]]);
        team1Goal.add(0);
        team2Goal.add(0);
        goalscorer1.add([]);
        goalscorer2.add([]);
      }
    }
    print('Fixture generated: $_leagueFixture');

    notifyListeners();
  }

  void clearFix() {
    _leagueFixture.clear();
    notifyListeners();
  }

  /////////////////////////////////
  ///
  ///store scores per match
  List<int> team1Goal = [];
  List<int> team2Goal = [];

  List<List<TextEditingController>> goalscorer1 = [];
  List<List<TextEditingController>> goalscorer2 = [];

  void goalIncre2(int matchIndex) {
    team2Goal[matchIndex]++;
    goalscorer2[matchIndex].add(TextEditingController());
    notifyListeners();
  }

  void goalIncre1(int matchIndex) {
    team1Goal[matchIndex]++;
    goalscorer1[matchIndex].add(TextEditingController());
    notifyListeners();
  }

  void goalDecre1(int matchIndex) {
    if (team1Goal[matchIndex] > 0) {
      team1Goal[matchIndex]--;
      goalscorer1[matchIndex].removeLast();
      notifyListeners();
    }
  }

  void goalDecre2(int matchIndex) {
    if (team2Goal[matchIndex] > 0) {
      team2Goal[matchIndex]--;
      goalscorer2[matchIndex].removeLast();
      notifyListeners();
    }
  }
}
