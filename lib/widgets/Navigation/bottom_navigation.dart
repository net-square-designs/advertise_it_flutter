import 'dart:io';

import 'package:advertise_it/themes/colors.dart';
import 'package:flutter/material.dart';

Widget bottomNavigation(context, {screenName}) {
  useScreenName(String tabName) {
    return screenName == tabName ? appPink : Colors.white;
  }

  getIcon(IconData icon, [size]) {
    return Icon(icon, size: size ?? 30);
  }

  navigateToScreen(routeName) {
    if (routeName != ModalRoute.of(context).settings.name) {
      Navigator.pushNamed(context, routeName);
    }
  }

  return Container(
    height: Platform.isIOS ? 80.0 : 50,
    alignment: Alignment.center,
    child: BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: getIcon(Icons.home),
            onPressed: () => navigateToScreen('/home'),
            color: useScreenName('/home'),
          ),
          IconButton(
            icon: getIcon(Icons.explore),
            onPressed: () => navigateToScreen('/explore'),
            color: useScreenName('/explore'),
          ),
          IconButton(
            icon: getIcon(Icons.add_circle),
            onPressed: () => navigateToScreen('/add-product'),
            color: useScreenName('/add-product'),
          ),
          IconButton(
            icon: getIcon(Icons.favorite),
            onPressed: () => navigateToScreen('/activity'),
            color: useScreenName('/activity'),
          ),
          IconButton(
            icon: getIcon(Icons.person),
            onPressed: () => navigateToScreen('profile'),
            color: useScreenName('profile'),
          ),
        ],
      ),
    ),
  );
}
