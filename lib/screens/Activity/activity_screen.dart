import 'package:advertise_it/screens/Activity/activity_body.dart';
import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/widgets/Buttons/CustomBackButton.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/Navigation/bottom_navigation.dart';
import 'package:advertise_it/widgets/Navigation/top_Navigation.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  static final routeName = '/activity';

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int activeIndex = 0;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigation(
        title: Center(
          child: CustomText(
            'Activity',
            styleName: StyleName.title,
          ),
        ),
        leading: CustomBackButton(),
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            child: CustomText(
              '',
              color: appPink,
              styleName: StyleName.title,
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              child: Text(
                'Recent',
              ),
            ),
            Tab(
              child: Text(
                'Products',
              ),
            ),
            Tab(
              child: Text(
                'Promotions',
              ),
            ),
            Tab(
              child: Text(
                'People',
              ),
            )
          ],
        ),
      ),
      body: ActivityBody(tabController: _tabController),
      bottomNavigationBar: bottomNavigation(
        context,
        screenName: ActivityScreen.routeName,
      ),
    );
  }
}
