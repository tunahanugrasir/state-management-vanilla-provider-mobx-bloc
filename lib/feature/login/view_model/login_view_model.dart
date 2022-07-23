import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool isChekBoxOkey = false;
  bool isLoading = false;
  String? _inputText;

  void checkBoxChange(bool value) {
    isChekBoxOkey = value;
    notifyListeners();
  }

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<bool> controlTextValue() async {
    _changeLoading();
    await Future.delayed(const Duration(seconds: 1));
    _changeLoading();

    return _inputText != null;
  }
}
