import 'package:advertise_it/screens/Home/home_screen.dart';
import 'package:flutter/material.dart';

class BootstrapApp extends StatelessWidget {
  final bool _isAuthenticated = true;

  Widget _checkAuth() {
    if (!_isAuthenticated) {
      return Text('I am authenticated');
    }
    return HomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return _checkAuth();
  }
}