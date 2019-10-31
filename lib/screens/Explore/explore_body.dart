import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExploreBody extends StatelessWidget {
  Widget exploreCard() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ClipRRect(
          child: Image.network(
            'https://static.zumiez.com/skin/frontend/delorum/default/images/Champion-Shoes-Neon-Black-Kids-072629-750x466.jpg',
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.45),
              borderRadius: BorderRadius.circular(20)),
        ),
        Positioned(
          bottom: 30,
          left: 10,
          child: CustomText(
            'Nike Collections',
            styleName: StyleName.subhead,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  arrangeTiles(int index) {
    final count = index + 1;
    if ((count ~/ 2).isEven || count == 2) {
      return StaggeredTile.count(2, 2);
    }
    return StaggeredTile.count(4, 2);
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
