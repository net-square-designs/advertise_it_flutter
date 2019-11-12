import 'package:advertise_it/providers/single_product_provider.dart';
import 'package:advertise_it/screens/ViewProducts/single_product_body.dart';
import 'package:advertise_it/widgets/Navigation/top_Navigation.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ViewSingleProductArguments {
  final int id;

  ViewSingleProductArguments({this.id});
}

class ViewSingleProduct extends StatefulWidget {
  static final routeName = '/single-product';

  @override
  _ViewSingleProductState createState() => _ViewSingleProductState();
}

class _ViewSingleProductState extends State<ViewSingleProduct> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () async {
        final SingleProductsProvider singleProductsProvider =
            Provider.of<SingleProductsProvider>(context);

        final ViewSingleProductArguments routeArgs =
            ModalRoute.of(context).settings.arguments;

        await singleProductsProvider.fetchOneProduct(
          productId: routeArgs.id,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final SingleProductsProvider singleProductsProvider =
        Provider.of<SingleProductsProvider>(context);

    return Scaffold(
      appBar: topNavigation(
        leading: RawMaterialButton(
          onPressed: () {
            Navigator.pop(context, singleProductsProvider.product);
          },
          child: Icon(FontAwesomeIcons.angleLeft),
          shape: CircleBorder(),
          padding: const EdgeInsets.all(10.0),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.shopping_basket),
          )
        ],
      ),
      body: Builder(builder: (BuildContext context) {
        return SingleProductBody();
      }),
    );
  }
}
