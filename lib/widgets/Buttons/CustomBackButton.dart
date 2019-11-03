import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Icon(FontAwesomeIcons.angleLeft),
      shape: CircleBorder(),
      padding: const EdgeInsets.all(10.0),
    );
  }
}
