import 'package:advertise_it/screens/AddProduct/add_product_body.dart';
import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/Navigation/bottom_navigation.dart';
import 'package:advertise_it/widgets/Navigation/top_Navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddProductScreen extends StatelessWidget {
  static final routeName = '/add-product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigation(
        title: Center(
          child: CustomText(
            'Add Product',
            styleName: StyleName.title,
          ),
        ),
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.angleLeft),
          onPressed: () {},
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: (){},
            child: CustomText(
              'Next',
              color: appPink,
              styleName: StyleName.title,
            ),
          )
        ],
      ),
      body: AddProductBody(),
      bottomNavigationBar: bottomNavigation(context, screenName: routeName),
    );
  }
}
