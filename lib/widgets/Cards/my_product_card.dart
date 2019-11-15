import 'package:advertise_it/models/products.interface.dart';
import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/utils/stringHelpers.dart';
import 'package:advertise_it/widgets/Buttons/circle_button.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/LoadImage/loadImage.dart';
import 'package:flutter/material.dart';

class MyProductCard extends StatelessWidget {
  final IProducts product;
  MyProductCard({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ClipRRect(
          child: CustomImage(
            imageUrl: product.mediaUrl,
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
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  circleButton(color: appBlack[300], icon: Icons.edit),
                ],
              ),
              CustomText(
                truncateWithEllipsis(text: product.title, cutoff: 35),
                styleName: StyleName.subhead,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      // Icon(
                      //   Icons.check_circle,
                      //   color: Colors.greenAccent,
                      //   size: 18,
                      // ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: product.isPublished ? appBlack[400] : appPink,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: CustomText(
                          product.isPublished ? 'Published' : 'Not Publised',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomText(
                    '${product.views} views',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
