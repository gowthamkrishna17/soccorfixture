import 'package:flutter/material.dart';

class FixconfigVm extends ChangeNotifier {
  TextEditingController teamCount = TextEditingController();

  List<TextEditingController> feild = [];

  int get teamc => feild.length;

  updateCount() {
    final count = int.tryParse(teamCount.text);
    if (count != null) {
      for (int i = feild.length; i < count; i++) {
        feild.add(TextEditingController());
      }
    } else if (count! < feild.length) {
      feild = feild.sublist(0, count);
    } else if (count == 0) {
      return 'enter';
    }

    notifyListeners();
  }

  void deleletTeam(int index) {
    if (index > 0 && index < feild.length) {
      feild.removeAt(index);
      notifyListeners();
    }
  }

  bool enableGS = false;
  bool enableGc = false;
  bool enableGd = true;

  bool enblleague = true;
  bool enblknockout = false;

  toggleLeague() {
    if (enblleague = true) {
      enblknockout = false;
    }
    notifyListeners();
  }

  toggleKnockout() {
    if (enblknockout = true) {
      enblleague = false;
    }
    notifyListeners();
  }
}
