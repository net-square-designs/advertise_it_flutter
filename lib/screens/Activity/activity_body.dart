import 'package:advertise_it/providers/auth_user_products.dart';
import 'package:advertise_it/screens/Activity/overview_section.dart';
import 'package:advertise_it/screens/AddProduct/add_product_screen.dart';
import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/widgets/Cards/follow_promoter_card.dart';
import 'package:advertise_it/widgets/Cards/my_product_card.dart';
import 'package:advertise_it/widgets/Cards/promotion_card.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/Loaders/loaders.dart';
import 'package:advertise_it/widgets/Tiles/follow_sugestion.dart';
import 'package:advertise_it/widgets/Tiles/recent_activity_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

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
          child: CustomText(
            'Trending Promoters',
            styleName: StyleName.subtitle,
          ),
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
          child: CustomText(
            'Suggestions',
            styleName: StyleName.subtitle,
          ),
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
        ChangeNotifierProvider(
          builder: (_) => AuthUserProductsProvider(),
          child: ProductsTab(),
        ),
        promotionTab(context),
        peopleTab(context),
      ],
    );
  }
}

class ProductsTab extends StatefulWidget {
  @override
  _ProductsTabState createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  ScrollController _scrollController = new ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void initState() {
    Future.delayed(Duration.zero, () {
      final AuthUserProductsProvider authUserProductsProvider =
          Provider.of<AuthUserProductsProvider>(context);

      authUserProductsProvider.fetchMyProducts(
        page: authUserProductsProvider.startPage,
        pageSize: 20,
        isFresh: true,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuthUserProductsProvider authUserProductsProvider =
        Provider.of<AuthUserProductsProvider>(context);

    final products = authUserProductsProvider.products;

    _scrollController.addListener(() {
      print('isFetching : : :å${authUserProductsProvider.isFetching}');
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (authUserProductsProvider.isFetching == true) {
          return null;
        }

        if (authUserProductsProvider.nextPage <=
            authUserProductsProvider.paginationData.totalPages) {
          return authUserProductsProvider.fetchMyProducts(
            page: authUserProductsProvider.nextPage,
            pageSize: authUserProductsProvider.paginationData.pageSize,
          );
        }
      }
      return null;
    });

    Widget renderBody() {
      if (products.length == 0) {
        if (authUserProductsProvider.isFetching) {
          return Center(child: circleLoader());
        }
        return Center(
          child: CustomText('No products to display at the moment'),
        );
      }
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
                  child: CustomText(
                    'My Products',
                    styleName: StyleName.subtitle,
                  ),
                ),
                Expanded(
                  child: StaggeredGridView.countBuilder(
                      crossAxisCount: 4,
                      itemCount: products.length,
                      staggeredTileBuilder: (index) =>
                          StaggeredTile.count(2, 2),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == products.length) {
                          if (index >=
                              authUserProductsProvider.paginationData.count) {
                            return Container();
                          }
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: circleLoader()),
                          );
                        }

                        return MyProductCard(product: products[index]);
                      }),
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

    return renderBody();
  }
}
