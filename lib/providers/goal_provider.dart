import 'package:flutter/material.dart';

class GoalProvider with ChangeNotifier {
  String? _selectedText;
  IconData? _selectedIcon;

  String? get selectedText => _selectedText;
  IconData? get selectedIcon => _selectedIcon;

  void setSelectedGoal(String text, IconData icon) {
    _selectedText = text;
    _selectedIcon = icon;
    notifyListeners();
  }
}
