import 'package:advertise_it/providers/auth_provider.dart';
import 'package:advertise_it/screens/Profile/profile_body.dart';
import 'package:advertise_it/screens/Settings/settings_screen.dart';
import 'package:advertise_it/widgets/Buttons/CustomBackButton.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/Navigation/bottom_navigation.dart';
import 'package:advertise_it/widgets/Navigation/top_Navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static final routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);

    Widget _renderBody() {
      if (authProvider.user != null) {
        return ProfileBody(user: authProvider.user);
      }

      return Center(
        child: CustomText('You need to be loged in to access this page'),
      );
    }
    
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
      body: _renderBody(),
      bottomNavigationBar: bottomNavigation(context, screenName: routeName),
    );
  }
}
