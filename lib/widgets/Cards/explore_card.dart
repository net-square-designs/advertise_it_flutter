import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:flutter/material.dart';

class ExploreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}