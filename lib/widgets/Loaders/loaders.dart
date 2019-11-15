import 'package:flutter/material.dart';

Widget circleLoader() {
  return SizedBox(
    height: 20,
    width: 20,
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    ),
  );
}
