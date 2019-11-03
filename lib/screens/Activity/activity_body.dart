import 'package:advertise_it/screens/Activity/overview_section.dart';
import 'package:advertise_it/screens/AddProduct/add_product_screen.dart';
import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/widgets/Cards/follow_promoter_card.dart';
import 'package:advertise_it/widgets/Cards/my_product_card.dart';
import 'package:advertise_it/widgets/Cards/promotion_card.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/Tiles/follow_sugestion.dart';
import 'package:advertise_it/widgets/Tiles/recent_activity_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ActivityBody extends StatelessWidget {
  final TabController tabController;

  ActivityBody({this.tabController});

  Widget recentActivityTab() {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: 10,
      itemBuilder: (context, index) {
        return RecentActivityTile(isViewed: index.isEven);
      },
    );
  }

  Widget productsTab(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ...overviewSection(),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText('My Products', styleName: StyleName.subtitle),
              ),
              Expanded(
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) =>
                      MyProductCard(),
                  staggeredTileBuilder: (index) => StaggeredTile.count(2, 2),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 0,
            child: FloatingActionButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AddProductScreen.routeName),
              backgroundColor: appPink,
              child: Icon(
                Icons.add,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget promotionTab(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Stack(
        children: <Widget>[
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    CustomText(
                      'Current Promotions',
                      styleName: StyleName.subtitle,
                    ),
                    CustomText(
                      'You have 3 live promotions',
                      styleName: StyleName.caption,
                    )
                  ],
                ),
              ),
              Expanded(
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) =>
                      PromotionCard(),
                  staggeredTileBuilder: (index) => StaggeredTile.count(2, 2),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget peopleTab(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: CustomText('Trending Promoters', styleName: StyleName.subtitle,),
        ),
        Container(
          height: 160,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 2.5),
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (context, index) => FollowPromoterCard(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: CustomText('Suggestions', styleName: StyleName.subtitle,),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 2.5),
            itemCount: 10,
            itemBuilder: (context, index) {
              return FollowSuggestionTile();
            },
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: <Widget>[
        recentActivityTab(),
        productsTab(context),
        promotionTab(context),
        peopleTab(context),
      ],
    );
  }
}
