import 'package:advertise_it/providers/products_provider.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/Loaders/loaders.dart';
import 'package:advertise_it/widgets/Product/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  ScrollController _scrollController = new ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context);
    final products = productsProvider.products;
    final paginationData = productsProvider.paginationData;

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (productsProvider.isFetching == true) {
          return null;
        }
        if (productsProvider.nextPage <=
            productsProvider.paginationData.totalPages) {
          return productsProvider.fetchProducts(
            page: productsProvider.nextPage,
            pageSize: paginationData.pageSize,
          );
        }
      }
      return null;
    });

    Widget renderBody() {
      if (products.length == 0) {
        if (productsProvider.isFetching) {
          return Center(child: circleLoader());
        }
        return Center(
          child: CustomText('No products to display at the moment'),
        );
      }
      return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: products.length + 1,
        controller: _scrollController,
        itemBuilder: (context, index) {
          if (index == products.length) {
            if (index >= productsProvider.paginationData.count) {
              return Container();
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: circleLoader()),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Product(
              mediaUrl: products[index].mediaUrl,
              views: products[index].views,
              likes: products[index].likes,
              price: products[index].price,
              title: products[index].title,
              ownerName:
                  '${products[index].productOwner['firstName']} ${products[index].productOwner['lastName']}',
              avatarUrl: products[index].productOwner['image'],
            ),
          );
        },
      );
    }

    return renderBody();
  }
}
