import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:flutter/material.dart';

class OverviewCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String total;

  OverviewCard({this.title, this.icon, this.total});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appWhite[100],
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              icon,
              color: appBlue,
              size: 20,
            ),
            SizedBox(height: 30),
            CustomText(
              title,
              styleName: StyleName.subtitle,
              color: appBlack[300],
            ),
            Row(children: <Widget>[
              CustomText(
                total,
                styleName: StyleName.caption,
                color: appPink,
              )
            ]),
          ],
        ),
      ),
    );
  }
}
