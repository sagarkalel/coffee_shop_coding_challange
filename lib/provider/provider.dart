import 'dart:async';

import 'package:first_challange_coffee_shop/data/coffee_model.dart';
import 'package:first_challange_coffee_shop/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  late SharedPreferences sharedPreferences;
  static final MyProvider _myProvider = MyProvider._persistedStates();
  factory MyProvider() => _myProvider;
  MyProvider._persistedStates() {
    initializePersistedStates();
  }
  Future initializePersistedStates() async {
    sharedPreferences = await SharedPreferences.getInstance();
    _myLocality = sharedPreferences.getString('myLocality') ?? _myLocality;
    _uid = sharedPreferences.getString("uid");
    _phoneNumber = sharedPreferences.getString("phone") ?? _phoneNumber;
    notifyListeners();
  }

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

  /// address
  String _userName = '';
  String get userName => _userName;
  set userName(String value) {
    _userName = value;
    notifyListeners();
  }

  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;
  set phoneNumber(String value) {
    _phoneNumber = value;
    sharedPreferences.setString("phone", value);
    notifyListeners();
  }

  final List<Address> _addresses = [];
  List<Address> get addresses => _addresses;
  set addAddress(Address value) {
    _addresses.add(value);
    notifyListeners();
  }

  set removeAddress(String docId) {
    Address item = _addresses.firstWhere((element) => element.id == docId);
    _addresses.remove(item);
    notifyListeners();
  }

  set updateAddress(Address value) {
    Address item = _addresses.firstWhere((element) => element.id == value.id);
    item.receiverContact = value.receiverContact;
    item.receiverName = value.receiverName;
    item.landmark = value.landmark;
    item.locality = value.locality;
    item.type = value.type;
    notifyListeners();
  }

  String _inUsedAddress = '';
  String get inUsedAddress => _inUsedAddress;
  set inUsedAddress(String id) {
    _inUsedAddress = id;
    notifyListeners();
  }

  String _myLocality = '';
  String get myLocality => _myLocality;
  set myLocality(String value) {
    _myLocality = value;
    sharedPreferences.setString('myLocality', value);
    notifyListeners();
  }

  /// auth screen
  late Timer _timer;
  int _resendTime = 59;
  int get resendTime => _resendTime;
  startTimer() {
    _resendTime = 59;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendTime == 0) {
        _timer.cancel();
        _isLoading = false;
        notifyListeners();
      } else {
        _resendTime--;
        notifyListeners();
      }
    });
  }

  canselTimer() {
    _timer.cancel();
    _resendTime = 59;
    _isLoading = false;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isResending = false;
  bool get isResending => _isResending;
  set isResending(bool value) {
    _isResending = value;
    notifyListeners();
  }

  int? _forceResendingToken;
  int? get forceResendingToken => _forceResendingToken;
  set forceResendingToken(int? value) {
    _forceResendingToken = value;
    notifyListeners();
  }

  String? _uid;
  String? get uid => _uid;
  set uid(String? value) {
    _uid = value;
    sharedPreferences.setString("uid", value ?? '');
    notifyListeners();
  }

  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;
  set setSearchText(String value) {
    _searchController.text = value;
    notifyListeners();
  }

  final List<String> _sizes = ["S", "M", "L"];
  List<String> get sizes => _sizes;
  final List<Map<String, int>> _selectedSize = [
    {'': 0}
  ];
  List<Map<String, int>> get selectedSize => _selectedSize;
  void addSelectedSize({required Map<String, int> value}) {
    if (_selectedSize
        .where((element) => element.keys.first == value.keys.first)
        .toList()
        .isNotEmpty) {
      _selectedSize
          .removeWhere((element) => element.keys.first == value.keys.first);
    }
    _selectedSize.add(value);
    notifyListeners();
  }

  int getSelectedSizeIndex(String id) {
    int selectedSizeIndexKey = 0;
    if (_selectedSize.isEmpty) {
      selectedSizeIndexKey = 0;
    } else {
      debugPrint("${_selectedSize.firstWhere((element) => true)}");
      selectedSizeIndexKey = _selectedSize
              .where((element) => element.keys.first == id)
              .toList()
              .isEmpty
          ? 0
          : _selectedSize
              .firstWhere((element) => element.keys.first == id)
              .values
              .first;
    }
    return selectedSizeIndexKey;
  }

  List<String> _allLikedCoffees = [];
  List<String> get allLikedCoffees => _allLikedCoffees;
  set allLikedCoffees(List<String> value) {
    _allLikedCoffees = value;
    notifyListeners();
  }

  void updateFavoriteCoffee(String id) {
    if (_allLikedCoffees.contains(id)) {
      _allLikedCoffees.remove(id);
    } else {
      _allLikedCoffees.add(id);
    }
    notifyListeners();
  }

  List<CoffeModel> _allCoffees = [];
  List<CoffeModel> get allCoffees => _allCoffees;
  set allCoffees(List<CoffeModel> value) {
    _allCoffees = value;
    notifyListeners();
  }
}
