import 'package:advertise_it/screens/Explore/explore_body.dart';
import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/widgets/Buttons/CustomBackButton.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/Navigation/bottom_navigation.dart';
import 'package:advertise_it/widgets/Navigation/top_Navigation.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  static final routeName = '/explore';

  final Widget bottomBar = PreferredSize(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: appBlack[300],
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(fontSize: 18, color: appPink),
          labelStyle: TextStyle(fontSize: 18, color: appPink),
          border: InputBorder.none,
          icon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(
              Icons.search,
              color: appPink,
            ),
          ),
        ),
        style: TextStyle(fontSize: 18, color: appPink),
      ),
    ),
    preferredSize: Size(50, 50),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigation(
          title: Center(
            child: CustomText(
              'Explore',
              styleName: StyleName.title,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(Icons.shopping_basket),
            )
          ],
          leading: CustomBackButton(),
          bottom: bottomBar),
      body: ExploreBody(),
      bottomNavigationBar: bottomNavigation(context, screenName: routeName),
    );
  }
}
