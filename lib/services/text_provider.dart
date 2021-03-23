import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextNotifier extends ChangeNotifier {
  final String key = 'num';
  int _num = 0;
  SharedPreferences _numPref;

  getCount() => _num;
  setCount(int num) => _num = num;

  TextNotifier() {
    _num = 0;
    _loadFromPrefs();
  }

  _initPrefs() async {
    if (_numPref == null) {
      _numPref = await SharedPreferences.getInstance();
    }
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _num = _numPref.getInt(key) ?? 0;
  }

  _saveToPrefs() async {
    await _initPrefs();
    _numPref.setInt(key, _num);
  }

  void incementNumber() {
    _num++;
    _saveToPrefs();
    notifyListeners();
  }

  void decrementNumber() {
    _num--;
    notifyListeners();
  }
}
