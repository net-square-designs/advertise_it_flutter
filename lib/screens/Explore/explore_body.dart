import 'package:advertise_it/providers/explore_provider.dart';
import 'package:advertise_it/widgets/Cards/explore_card.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/Loaders/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ExploreBody extends StatefulWidget {
  @override
  _ExploreBodyState createState() => _ExploreBodyState();
}

class _ExploreBodyState extends State<ExploreBody> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      // final ExploreProvider _exploreProvider =
      //     Provider.of<ExploreProvider>(context);

      // _exploreProvider.fetchCategories();
    });
  }

  arrangeTiles(int index) {
    final count = index + 1;
    if (count % 3 == 0) {
      return StaggeredTile.count(4, 2);
    }
    return StaggeredTile.count(2, 2);
  }

  @override
  Widget build(BuildContext context) {
    final ExploreProvider exploreProvider =
        Provider.of<ExploreProvider>(context);

    final categories = exploreProvider.categories;

    if (categories.length == 0) {
      if (exploreProvider.isFetching) {
        return Center(child: circleLoader());
      }
      return Center(
        child: CustomText('No categories to display at the moment'),
      );
    }

    return StaggeredGridView.countBuilder(
      padding: const EdgeInsets.all(15),
      crossAxisCount: 4,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) => ExploreCard(
        category: categories[index],
      ),
      staggeredTileBuilder: (index) => arrangeTiles(index),
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
    );
  }
}
