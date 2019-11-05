import 'package:advertise_it/providers/app_bootstrap_provider.dart';
import 'package:advertise_it/providers/auth_provider.dart';
import 'package:advertise_it/screens/Auth/login_screen.dart';
import 'package:advertise_it/screens/Home/home_screen.dart';
import 'package:advertise_it/screens/Splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BootstrapApp extends StatelessWidget {
  Widget checkDependencies(AppBootstrapProvider appProvider, AuthProvider authProvider) {
    // print(appProvider.hasSeenIntro);
    if (appProvider.isLoading) {
      return SplashScreen();
    }
    if (authProvider.authToken != null) {
      return HomeScreen();
    }
    return LoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    final AppBootstrapProvider appProvider =
        Provider.of<AppBootstrapProvider>(context);
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return checkDependencies(appProvider, authProvider);
  }
}
