import 'package:advertise_it/widgets/Tiles/recent_activity_tile.dart';
import 'package:flutter/material.dart';

class ActivityBody extends StatelessWidget {
  final TabController tabController;

  ActivityBody({this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: <Widget>[
        ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: 10,
          itemBuilder: (context, index) {
            return RecentActivityTile();
          },
        ),
        ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: 1,
          itemBuilder: (context, index) {
            return RecentActivityTile();
          },
        ),
        ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: 5,
          itemBuilder: (context, index) {
            return RecentActivityTile();
          },
        ),
        ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: 5,
          itemBuilder: (context, index) {
            return RecentActivityTile();
          },
        ),
      ],
    );
  }
}
