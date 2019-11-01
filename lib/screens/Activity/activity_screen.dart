import 'package:advertise_it/screens/Activity/activity_body.dart';
import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/Navigation/bottom_navigation.dart';
import 'package:advertise_it/widgets/Navigation/top_Navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    _tabController.addListener(() {
      setState(() {
        activeIndex = _tabController.index;
      });
    });
    return Scaffold(
      appBar: topNavigation(
        title: Center(
          child: CustomText(
            'Activity',
            styleName: StyleName.title,
          ),
        ),
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.angleLeft),
          onPressed: () {},
        ),
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
              child: CustomText(
                'Recent',
                styleName: StyleName.subtitle,
                color: activeIndex == 0 ? appPink : null,
              ),
            ),
            Tab(
              child: CustomText(
                'My Products',
                styleName: StyleName.subtitle,
                color: activeIndex == 1 ? appPink : null,
              ),
            ),
            Tab(
              child: CustomText(
                'Promotions',
                styleName: StyleName.subtitle,
                color: activeIndex == 2 ? appPink : null,
              ),
            ),
            Tab(
              child: CustomText(
                'People',
                styleName: StyleName.subtitle,
                color: activeIndex == 3 ? appPink : null,
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
