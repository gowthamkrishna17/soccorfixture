import 'package:fixbuilder/model/teamMode.dart';
import 'package:flutter/cupertino.dart';

// class LeaguetableVm extends ChangeNotifier {
//   List<Team> _teams = [];
//   List<Team> get teams => _teams;

//   void setTeams(List<String> names) {
//     _teams = names.map((n) => Team(name: n)).toList();
//     notifyListeners();
//   }

//   void updateMatchResult(String winner, String loser) {
//     final winTeam = _teams.firstWhere((t) => t.name == winner);
//     final loseTeam = _teams.firstWhere((t) => t.name == loser);

//     winTeam.win++;
//     winTeam.played++;
//     winTeam.played + 3;

//     loseTeam.played++;
//     loseTeam.lost++;
//     notifyListeners();
//   }

//   void sortTable() {
//     _teams.sort((a, b) => b.points.compareTo(a.points));
//     notifyListeners();
//   }
// }

class VmLeagueTable extends ChangeNotifier {
  List<Team> teams = [];

  void setTeams(List<String> names) {
    teams =
        names
            .where((n) => n.isNotEmpty)
            .map((name) => Team(name: name))
            .toList();
    notifyListeners();
  }

  void updateStats(
    int index, {
    int? played,
    int? wins,
    int? draws,
    int,
    losses,
  }) {
    final t = teams[index];
    if (wins != null) t.win = wins;
    if (draws != null) t.draw = draws;
    if (losses != null) t.lost = losses;
    t.played = t.win + t.draw + t.lost;
    t.points = (t.win * 3) + (t.draw);
    notifyListeners();
  }

  void resetTable() {
    for (var t in teams) {
      t.played = 0;
      t.win = 0;
      t.draw = 0;
      t.lost = 0;
      t.points = 0;
    }
    notifyListeners();
  }
}
