import 'package:advertise_it/screens/Activity/activity_screen.dart';
import 'package:advertise_it/screens/AddProduct/add_product_screen.dart';
import 'package:advertise_it/screens/Explore/explore_screen.dart';
import 'package:advertise_it/screens/Home/home_screen.dart';
import 'package:advertise_it/screens/Profile/profile_screen.dart';
import 'package:advertise_it/screens/Settings/settings_screen.dart';
import 'package:advertise_it/themes/darkTheme.dart';
import 'package:flutter/material.dart';
import 'widgets/Bootstrap/bootstrap_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advertise It',
      theme: darkTheme(),
      home: BootstrapApp(),
      routes: {
        ExploreScreen.routeName: (context) => ExploreScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        AddProductScreen.routeName: (context) => AddProductScreen(),
        ActivityScreen.routeName: (context) => ActivityScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
        SettingsScreen.routeName: (context) => SettingsScreen(),
      },
    );
  }
}
