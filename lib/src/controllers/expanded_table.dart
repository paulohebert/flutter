import 'package:flutter/material.dart';

class ExpandedTableController with ChangeNotifier {
  static final ExpandedTableController _instance =
      ExpandedTableController._internal();

  factory ExpandedTableController() {
    return _instance;
  }

  ExpandedTableController._internal();

  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;

  void toggleExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
}
