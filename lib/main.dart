import 'package:advertise_it/providers/app_bootstrap_provider.dart';
import 'package:advertise_it/providers/auth_provider.dart';
import 'package:advertise_it/providers/products_provider.dart';
import 'package:advertise_it/screens/Activity/activity_screen.dart';
import 'package:advertise_it/screens/AddProduct/add_product_screen.dart';
import 'package:advertise_it/screens/Auth/login_screen.dart';
import 'package:advertise_it/screens/Explore/explore_screen.dart';
import 'package:advertise_it/screens/Home/home_screen.dart';
import 'package:advertise_it/screens/Profile/profile_screen.dart';
import 'package:advertise_it/screens/Settings/settings_screen.dart';
import 'package:advertise_it/themes/darkTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/Bootstrap/bootstrap_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsProvider>.value(
          value: ProductsProvider(),
        ),
        ChangeNotifierProvider<AppBootstrapProvider>.value(
          value: AppBootstrapProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>.value(
          value: AuthProvider(),
        ),
      ],
      child: MaterialApp(
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
          LoginScreen.routeName: (context) => LoginScreen(),
        },
      ),
    );
  }
}
