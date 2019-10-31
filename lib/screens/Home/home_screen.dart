import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/Navigation/bottom_navigation.dart';
import 'package:advertise_it/widgets/Navigation/top_Navigation.dart';
import 'package:flutter/material.dart';
import 'home_body.dart';

class HomeScreen extends StatelessWidget {
  static final routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigation(
        title: Center(
          child: CustomText(
            'AdvertiseIt',
            styleName: StyleName.title,
          ),
        ),
        leading: Icon(Icons.supervised_user_circle),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.shopping_basket),
          )
        ],
      ),
      body: HomeBody(),
      bottomNavigationBar: bottomNavigation(context, screenName: routeName),
    );
  }
}
