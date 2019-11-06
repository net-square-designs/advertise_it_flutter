import 'package:flutter/material.dart';

Widget circleLoader() {
  return CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
  );
}
