import 'dart:async';

import 'package:advertise_it/models/products.interface.dart';
import 'package:advertise_it/providers/products_provider.dart';
import 'package:advertise_it/providers/single_product_provider.dart';
import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/utils/stringHelpers.dart';
import 'package:advertise_it/widgets/Avatar/avatar.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/LoadImage/loadImage.dart';
import 'package:advertise_it/widgets/Loaders/loaders.dart';
import 'package:advertise_it/widgets/Toaster/toaster.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SingleProductBody extends StatelessWidget {
  List<Widget> buildImages(List productImages) {
    // print(productImages.length);
    return productImages.map(
      (image) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CustomImage(
            imageUrl: image['image'],
            height: 300,
          ),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    final SingleProductsProvider singleProductsProvider =
        Provider.of<SingleProductsProvider>(context);

    final ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context);

    final IProducts product = singleProductsProvider.product;

    if (singleProductsProvider.isFetching) {
      return Center(child: circleLoader());
    }
    if (singleProductsProvider.errors != null) {
      Future.delayed(Duration.zero, () {
        errorToaster(context, singleProductsProvider.errors);
      });
      return Center(child: CustomText(singleProductsProvider.errors));
    }

    if (productsProvider.products.length > 0) {
      // print(singleProductsProvider.product.productImages.length);
      // productsProvider.updateProductList(product);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: CustomText(
                  product.title,
                  styleName: StyleName.title,
                ),
              ),
              Icon(Icons.more_vert)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Avatar(
                    avatarUrl: product.productOwner['image'],
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomText(
                        truncateWithEllipsis(
                          text: '${product.productOwner['firstName']}'
                              ' ${product.productOwner['lastName']}',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.remove_red_eye),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(product.views.toString()),
                          ),
                          Icon(Icons.favorite),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(product.likes.toString()),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                child: RaisedButton(
                  child: Text(
                    singleProductsProvider.isFollowing
                        ? 'Following'
                        : 'Follow Seller',
                  ),
                  onPressed: () {
                    singleProductsProvider.followSeller(
                      sellerId: product.productOwner['userId'],
                      context: context,
                    );
                  },
                  color:
                      singleProductsProvider.isFollowing ? appBlack[400] : null,
                ),
                height: 25,
              ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              ListView(
                children: <Widget>[
                  ...buildImages(product.productImages),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white60,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black87,
                            blurRadius: 45.0,
                          ),
                        ],
                      ),
                      child: ButtonBar(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          InkWell(
                            child: Icon(
                              FontAwesomeIcons.solidCommentDots,
                              color: appBlack[300],
                            ),
                            onTap: () {},
                          ),
                          Icon(
                            FontAwesomeIcons.share,
                            color: appBlack[300],
                          ),
                          InkWell(
                            child: Icon(
                              Icons.favorite,
                              color: singleProductsProvider.isLikedByUser
                                  ? appPink
                                  : appBlack[300],
                            ),
                            onTap: () => singleProductsProvider.likeProduct(
                                productId: product.id, context: context),
                          ),
                        ],
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(FontAwesomeIcons.shoppingCart),
                      backgroundColor: appBlue,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
