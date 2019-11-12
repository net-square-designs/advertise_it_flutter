import 'package:advertise_it/screens/Auth/login_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static final routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: LoginBody(),
      ),
    );
  }
}
