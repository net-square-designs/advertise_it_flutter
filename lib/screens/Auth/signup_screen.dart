import 'package:advertise_it/screens/Auth/signup_body.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  static final routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: SignupBody(),
      ),
    );
  }
}
