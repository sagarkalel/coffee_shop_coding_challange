import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  /// for dashboard
  int _currentNavBar = 0;
  int get currentNavBar => _currentNavBar;
  set currentNavBar(int value) {
    _currentNavBar = value;
    notifyListeners();
  }

  /// for home
  final List _coffeeType = [
    'Cappuccino',
    'Machiato',
    'Latte',
    'Mocha',
    'Flat white',
    'Affogato',
    'Ristretto',
  ];
  List get coffeeType => _coffeeType;
  set addCoffeeTypeItem(item) {
    _coffeeType.add(item);
    notifyListeners();
  }

  String _selectedCoffeeType = '';
  String get selectedCoffeeType => _selectedCoffeeType;
  set selectedCoffeeType(String value) {
    _selectedCoffeeType = value;
    notifyListeners();
  }
}
