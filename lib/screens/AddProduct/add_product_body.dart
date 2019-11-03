import 'package:advertise_it/screens/AddProduct/sections.dart';
import 'package:flutter/material.dart';

class AddProductBody extends StatelessWidget {
  final PageController _pageController = PageController();

  scrollToNext() {
    return _pageController.nextPage(
        duration: Duration(seconds: 1), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          section1(scrollToNext),
          section2(scrollToNext),
          section3(scrollToNext),
          section4(scrollToNext),
          section5(),
        ],
      ),
    );
  }
}
