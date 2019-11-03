import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/widgets/Avatar/avatar.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:flutter/material.dart';

class FollowSuggestionTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: appBlack[400],
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
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
                    CustomText(
                      'Merchant',
                      styleName: StyleName.caption,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 25,
              child: RaisedButton(
                child: Text('Follow'),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
