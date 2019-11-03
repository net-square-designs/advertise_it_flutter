import 'package:advertise_it/widgets/Cards/overview_card.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Widget> overviewSection() {
  return [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomText('Overview', styleName: StyleName.subtitle),
    ),
    Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: OverviewCard(
            title: 'Solid',
            icon: FontAwesomeIcons.sellcast,
            total: '235',
          ),
        ),
        Expanded(
          flex: 1,
          child: OverviewCard(
            title: 'Purchased',
            icon: FontAwesomeIcons.shoppingBasket,
            total: '300',
          ),
        ),
        Expanded(
          flex: 1,
          child: OverviewCard(
            title: 'Wished',
            icon: FontAwesomeIcons.solidHeart,
            total: '300',
          ),
        ),
      ],
    ),
  ];
}
