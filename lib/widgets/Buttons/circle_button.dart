import 'package:flutter/material.dart';

Widget circleButton({Color color, IconData icon}) {
  return RawMaterialButton(
    onPressed: () {},
    child: Icon(icon),
    shape: CircleBorder(),
    fillColor: color,
    padding: const EdgeInsets.all(10.0),
  );
}


