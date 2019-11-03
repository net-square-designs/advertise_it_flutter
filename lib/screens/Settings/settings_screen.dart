import 'package:advertise_it/screens/Settings/settings_body.dart';
import 'package:advertise_it/widgets/Buttons/CustomBackButton.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/Navigation/top_Navigation.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static final routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigation(
        title: CustomText('Settings', styleName: StyleName.title),
        leading: CustomBackButton(),
      ),
      body: SettingsBody()
    );
  }
}

/*

*/
