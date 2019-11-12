import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

enum bootstrap {
  hasSeenIntro,
  isLoading,
}
class AppBootstrapProvider extends ChangeNotifier {
  bool _isLoading = true;
  bool _hasSeenIntro = false;
  double version = 0.5;

  AppBootstrapProvider() {
    bootstrapApp();
  }

  bool get isLoading => _isLoading;
  bool get hasSeenIntro => _hasSeenIntro;

  // used to set the splash screen loading status
  void setLoading(bool newValue) {
    _isLoading = newValue;
    notifyListeners();
  }

  // Used to decide whether or not to shaow the intro screen
  void setIntroStatus(bool status) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('${bootstrap.hasSeenIntro}', status);
    _hasSeenIntro = status;
    notifyListeners();
  }

  // toggles the is loading value
  void toggleLoading() {
    bool newValue = !isLoading;

    setLoading(newValue);
  }

  // called to bootstrap the app
  Future<void> bootstrapApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenIntro = prefs.getBool('${bootstrap.hasSeenIntro}');

    if (hasSeenIntro == null) {
      setIntroStatus(false);
    }

    const timeOut = const Duration(milliseconds: 800);

    Timer(timeOut, () {
      toggleLoading();
    });
  }
}
