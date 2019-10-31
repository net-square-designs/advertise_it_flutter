import 'package:advertise_it/widgets/Product/product.dart';
import 'package:advertise_it/mocks/products.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List products = getProducts();

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Product(
            mediaUrl: products[index]['mediaUrl'],
            views: products[index]['views'],
            likes: products[index]['likes'],
            price: products[index]['price'],
            title: products[index]['title'],
            ownerName: products[index]['productOwner']['name'],
            avatarUrl: products[index]['productOwner']['avatarUrl'],
          ),
        );
      },
    );
  }
}
