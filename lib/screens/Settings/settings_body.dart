import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/widgets/Avatar/avatar.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBlack[400],
      child: Column(
        children: <Widget>[
          Row(
            //Account
            children: <Widget>[
              Expanded(
                child: Container(
                  color: appBlack[300],
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: CustomText('ACCOUNT',
                            color: appPink, styleName: StyleName.body1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Avatar(
                                avatarUrl:
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRlq6GhzvlrOHG_LlCz2OT267Tz5XHt9KO9LeExw9DOm6ysetNp',
                                size: 20,
                              ),
                              SizedBox(width: 10),
                              CustomText('Edit Account'),
                            ],
                          ),
                          Icon(FontAwesomeIcons.solidArrowAltCircleRight)
                        ],
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        child: CustomText('Sign out', color: appWhite[100]),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            //Nottifications
            children: <Widget>[
              Expanded(
                child: Container(
                  color: appBlack[300],
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: CustomText('NOTIFICATIONS',
                            color: appPink, styleName: StyleName.body1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CustomText(
                            'Push Notifications',
                            color: appWhite[100],
                          ),
                          Icon(FontAwesomeIcons.solidArrowAltCircleRight)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            //Nottifications
            children: <Widget>[
              Expanded(
                child: Container(
                  color: appBlack[300],
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: CustomText('USER INTERFACE',
                            color: appPink, styleName: StyleName.body1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CustomText(
                                'Dark Theme',
                                color: appWhite[100],
                              ),
                              CustomText(
                                'Dark mode is on, tap to switch',
                                styleName: StyleName.caption,
                              ),
                            ],
                          ),
                          Switch(
                            onChanged: (value) {},
                            value: true,
                            activeTrackColor: Colors.grey,
                            activeColor: appPink,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            //Nottifications
            children: <Widget>[
              Expanded(
                child: Container(
                  color: appBlack[300],
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: CustomText('MORE',
                            color: appPink, styleName: StyleName.body1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CustomText(
                                'About AdvertiseIt',
                                color: appWhite[100],
                              ),
                              CustomText(
                                'More about our services',
                                styleName: StyleName.caption,
                              ),
                            ],
                          ),
                          Icon(FontAwesomeIcons.solidArrowAltCircleRight),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
