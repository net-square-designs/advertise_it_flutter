import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/widgets/Avatar/avatar.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:flutter/material.dart';

class RecentActivityTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: appBlack[400],
      margin: EdgeInsets.all(5),
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Avatar(
              avatarUrl:
                  'https://i.pinimg.com/originals/cc/10/c0/cc10c0179a02928c20ba5c749f79c8c5.jpg',
              size: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomText(
                  'Dumebi Bolt',
                  styleName: StyleName.subtitle,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Added your product to wishlist',
                    style: TextStyle(fontSize: 10),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' - 2s ago',
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          color: appBlack[100],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
