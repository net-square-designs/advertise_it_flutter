import 'package:advertise_it/mocks/products.dart';
import 'package:advertise_it/models/products.interface.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  List<IProducts> _products = [];

  ProductsProvider() {
    fetchProducts();
  }

  List<IProducts> get products => _products;

  void setProducts(List<IProducts> productsList) {
    _products = productsList;
    notifyListeners();
  }

 
  /// add more products
  addProducts(List<IProducts> productList) {
    _products.addAll(productList);
    notifyListeners();
  }

  /// Fetch products data from the backend
  Future<List<IProducts>> fetchProducts() async {
    List productsArray = getProducts();
    List<IProducts> productList;

    if (productsArray.length > 0) {
      productList = productsArray.map((products) {
        return IProducts.fromMap(products);
      }).toList();

      setProducts(productList);
    }

    return productList;
  }
}
