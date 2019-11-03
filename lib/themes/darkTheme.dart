import 'package:advertise_it/themes/colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme() => ThemeData(
    scaffoldBackgroundColor: appBlack[300],
    brightness: Brightness.dark,
    primaryColor: appPink,
    accentColor: appBlue,
    bottomAppBarColor: appBlack[400],
    buttonTheme: ButtonThemeData(buttonColor: appPink),
    appBarTheme: AppBarTheme(
      color: appBlack[400],
      elevation: 1.0,
    ),
    tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          border: Border(bottom: BorderSide(color: appPink, width: 3)),
        ),
        labelColor: appPink,
        unselectedLabelColor: appWhite[200]),
    cardTheme: CardTheme(color: appBlack[400]));
