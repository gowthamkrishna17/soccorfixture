import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FixconfigVm extends ChangeNotifier {
  TextEditingController teamCount = TextEditingController();
  TextEditingController tournamentName = TextEditingController();

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
  bool enblLogo = false;

  bool enbleposter = true;

  togglePosetr() {
    enbleposter = !enbleposter;
    print(enbleposter);
    notifyListeners();
  }

  toggleLogo() {
    enblLogo = !enblLogo;
    print(enblLogo);
    notifyListeners();
  }

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
  //____________IMAGEPICKER______________________________________________

  File? _pickedImage;
  File? get pickedImage => _pickedImage;
  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      _pickedImage = File(image.path);
      notifyListeners();
    }
  }
}
