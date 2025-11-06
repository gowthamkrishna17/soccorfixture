import 'package:flutter/cupertino.dart';

class Calendervm extends ChangeNotifier {
  DateTime _selectedtime = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  DateTime get selectedtime => _selectedtime;
  DateTime get focusedDay => _focusedDay;

  void updateDateTime(DateTime newDate) {
    _selectedtime = newDate;
    notifyListeners();
  }

  void updateFocus(DateTime focused) {
    _focusedDay = focused;
    notifyListeners();
  }
}
