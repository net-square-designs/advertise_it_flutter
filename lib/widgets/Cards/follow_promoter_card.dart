import 'package:advertise_it/widgets/Avatar/avatar.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:flutter/material.dart';

class FollowPromoterCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Avatar(
              avatarUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRfFN_HaMAI3knflArJplfUa1ies5PmAi_t3Q4XSBUHzhV5BTHG',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                'Mr Tony Stark',
                styleName: StyleName.subtitle,
              ),
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
