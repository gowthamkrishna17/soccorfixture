import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagepickervm extends ChangeNotifier {
  File? _Image;
  bool _ImagePick = true;

  bool get ImagePick => _ImagePick;

  final ImagePicker _imagePicker = ImagePicker();

  File? get image => _Image;

  List<File?> teamimages = [null];

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      _Image = File(pickedFile.path);
      print('pick');

      notifyListeners();
    }
  }

  void toggleImage(bool value) {
    _ImagePick = value;
    notifyListeners();
  }

  // void toggleTeamImage(bool value) {
  //   _enableTeamImg = value;
  //   notifyListeners();
  // }

  void clearImage() {
    _Image = null;
    notifyListeners();
  }

  Future<void> teamImg(int index) async {
    final teampick = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (teampick != null) {
      teamimages[index] = File(teampick.path);
    }
    notifyListeners();
  }
}
