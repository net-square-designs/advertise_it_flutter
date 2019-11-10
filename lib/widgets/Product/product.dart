import 'package:advertise_it/models/products.interface.dart';
import 'package:advertise_it/providers/products_provider.dart';
import 'package:advertise_it/screens/ViewProducts/single_product.dart';
import 'package:advertise_it/utils/stringHelpers.dart';
import 'package:advertise_it/widgets/Avatar/avatar.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/LoadImage/loadImage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Product extends StatelessWidget {
  final int id;
  final String mediaUrl;
  final int views;
  final int likes;
  final String price;
  final String title;
  final String ownerName;
  final String avatarUrl;
  final List productImages;

  Product({
    this.id,
    this.mediaUrl,
    this.views,
    this.likes,
    this.price,
    this.ownerName,
    this.avatarUrl,
    this.title,
    this.productImages,
  });

  Widget postMedia({@required mediaUrl, mediaType = 'image'}) {
    Widget cacheImage = CustomImage(
      imageUrl: mediaUrl,
      height: 240,
    );

    return Flexible(
      child: ClipRRect(
        child: Row(
          children: <Widget>[
            Expanded(
              child: InkWell(child: cacheImage,),
            ),
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
    );
  }

  Widget postTitle({
    @required String title,
    @required String ownerName,
    @required String ownerAvatar,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomText(
                  truncateWithEllipsis(text: title),
                  styleName: StyleName.title,
                ),
                CustomText(
                  'by $ownerName',
                  styleName: StyleName.caption,
                ),
              ],
            ),
          ),
          Avatar(
            avatarUrl: avatarUrl,
            size: 20,
          )
        ],
      ),
    );
  }

  Widget postActions({
    @required int views,
    @required int likes,
    @required double price,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.remove_red_eye, size: 18),
              SizedBox(width: 2),
              CustomText('$views'),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.favorite, size: 18),
              SizedBox(width: 2),
              CustomText('$likes')
            ],
          ),
          Icon(FontAwesomeIcons.solidCommentDots, size: 18),
          Icon(FontAwesomeIcons.share, size: 18),
          CustomText('N $price')
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          postMedia(mediaUrl: mediaUrl),
          InkWell(
            child: postTitle(
              title: title,
              ownerAvatar: avatarUrl,
              ownerName: ownerName,
            ),
            onTap: () async {
              final result = await Navigator.pushNamed(
                context,
                ViewSingleProduct.routeName,
                arguments: ViewSingleProductArguments(id: id),
              );

              if (result is IProducts) {
                productsProvider.updateProductList(result);
              }
            },
          ),
          postActions(
              views: (views), likes: (likes), price: double.parse(price))
        ],
      ),
    );
  }
}
