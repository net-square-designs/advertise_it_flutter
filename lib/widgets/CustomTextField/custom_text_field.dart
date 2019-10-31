import 'package:advertise_it/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;

  CustomTextField({@required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: TextCapitalization.words,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 18,
        ),
        labelStyle: TextStyle(fontSize: 18, color: appPink),
        border: InputBorder.none,
      ),
      style: TextStyle(fontSize: 18, color: appWhite[100]),
    );
  }
}
