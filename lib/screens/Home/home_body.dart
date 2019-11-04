import 'package:advertise_it/providers/products_provider.dart';
import 'package:advertise_it/widgets/Product/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductsProvider productsProvider = Provider.of<ProductsProvider>(context); 
    final products = productsProvider.products;

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Product(
            mediaUrl: products[index].mediaUrl,
            views: products[index].views,
            likes: products[index].likes,
            price: products[index].price,
            title: products[index].title,
            ownerName: products[index].productOwner['name'],
            avatarUrl: products[index].productOwner['avatarUrl'],
          ),
        );
      },
    );
  }
}
