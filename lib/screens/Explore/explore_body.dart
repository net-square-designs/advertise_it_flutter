import 'package:advertise_it/widgets/Cards/explore_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExploreBody extends StatelessWidget {
  Widget exploreCard() {
    return ExploreCard();
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
    return StaggeredGridView.countBuilder(
      padding: const EdgeInsets.all(15),
      crossAxisCount: 4,
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) => exploreCard(),
      staggeredTileBuilder: (index) => arrangeTiles(index),
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
    );
  }
}
