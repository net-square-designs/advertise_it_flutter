import 'dart:async';

import 'package:flutter/material.dart';

class AppBootstrapProvider extends ChangeNotifier {
  bool _isLoading = true;

  AppBootstrapProvider() {
    loadDependencies();
  }

  bool get isLoading => _isLoading;

  void setLoading(bool newValue) {
    _isLoading = newValue;
    notifyListeners();
  }

  void toggleLoading() {
    bool newValue = !isLoading;

    setLoading(newValue);
  }

  Future<void> loadDependencies() async {
    const timeOut = const Duration(milliseconds: 800);

    Timer(timeOut, () {
      toggleLoading();
    });
  }
}
