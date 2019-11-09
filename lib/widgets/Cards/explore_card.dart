import 'package:advertise_it/models/categories.interface.dart';
import 'package:advertise_it/utils/stringHelpers.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/LoadImage/loadImage.dart';
import 'package:flutter/material.dart';

class ExploreCard extends StatelessWidget {
  final ICategories category;

  const ExploreCard({Key key, @required this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ClipRRect(
          child: CustomImage(imageUrl: category.imageUrl),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.45),
              borderRadius: BorderRadius.circular(20)),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomText(
                  truncateWithEllipsis(text: category.name, cutoff: 35),
                  styleName: StyleName.subhead,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
