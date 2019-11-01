import 'package:advertise_it/screens/AddProduct/sections.dart';
import 'package:flutter/material.dart';

class AddProductBody extends StatelessWidget {
  @override
  Widget build(BuildContext context ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          section1(),
          section2(),
          section3(),
          section4(),
          section5(),
        ],
      ),
    );
  }
}
