import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  CounterProvider() {
    _loadCounter();
  }

  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('counter') ?? 0;
    notifyListeners();
  }

  Future<void> _saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', _counter);
  }

  void increment() {
    _counter++;
    _saveCounter();
    notifyListeners();
  }

  void decrement() {
    if (_counter > 0) {
      _counter--;
      _saveCounter();
      notifyListeners();
    }
  }

  void reset() {
    _counter = 0;
    _saveCounter();
    notifyListeners();
  }
}