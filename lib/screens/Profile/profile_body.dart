import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/widgets/Avatar/avatar.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBlack[400],
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Avatar(
              avatarUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSqkmkOfq_KfCyDpy9HwbKDYaEz1jz9kiGw2wNOMOyocp27ZCNA',
              size: 50,
            ),
            CustomText('Chris Hemsworth', styleName: StyleName.subtitle),
            CustomText('Lekki, Lagos', styleName: StyleName.caption),
            SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: Text(
                'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.instagram,
                      size: 16,
                    ),
                    Icon(
                      FontAwesomeIcons.twitter,
                      size: 16,
                    ),
                    Icon(
                      FontAwesomeIcons.facebook,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CustomText(
                      '220',
                      color: appPink,
                      styleName: StyleName.subtitle,
                    ),
                    CustomText('Proucts'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    CustomText(
                      '220',
                      color: appPink,
                      styleName: StyleName.subtitle,
                    ),
                    CustomText('Followers'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    CustomText(
                      '220',
                      color: appPink,
                      styleName: StyleName.subtitle,
                    ),
                    CustomText('Following'),
                  ],
                ),
              ],
            ),
            /*
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    padding: EdgeInsets.all(20),
                    color: appBlack[400],
                    child: CustomText('Account', color: appPink),
                  ),
                )
              ],
            ),
            */
          ],
        ),
      ),
    );
  }
}
