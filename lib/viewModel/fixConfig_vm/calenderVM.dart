import 'package:flutter/material.dart';

class Calendervm extends ChangeNotifier {
  DateTime? _pickedDate;
  DateTime? get pickedDate => _pickedDate;
  Future<void> selectDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (date != null) {
      _pickedDate = date;
      notifyListeners();
    }
  }
}
