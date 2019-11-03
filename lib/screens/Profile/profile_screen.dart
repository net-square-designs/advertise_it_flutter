import 'package:advertise_it/screens/Profile/profile_body.dart';
import 'package:advertise_it/screens/Settings/settings_screen.dart';
import 'package:advertise_it/widgets/Buttons/CustomBackButton.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/Navigation/bottom_navigation.dart';
import 'package:advertise_it/widgets/Navigation/top_Navigation.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static final routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigation(
        title: Center(
          child: CustomText(
            'Profile',
            styleName: StyleName.title,
          ),
        ),
        leading: CustomBackButton(),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(icon: Icon(Icons.settings), onPressed: () {
              return Navigator.pushNamed(context, SettingsScreen.routeName);
            },),
          ),
        ],
      ),
      body: ProfileBody(),
      bottomNavigationBar: bottomNavigation(context, screenName: routeName),
    );
  }
}
