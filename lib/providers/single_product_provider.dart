import 'dart:async';

import 'package:advertise_it/constants/api.dart';
import 'package:advertise_it/models/products.interface.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SingleProductsProvider extends ChangeNotifier {
  bool _isFetching = true;

  String _errors;
  IProducts _product;

  /// Public provider state getters
  bool get isFetching => _isFetching;
  String get errors => _errors;
  IProducts get product => _product;

  SingleProductsProvider() {
    // fetchOneProduct();
  }

  /// Public provider setters
  void setProduct(IProducts product) {
    _product = product;
    notifyListeners();
  }

  void startFetching() {
    _isFetching = true;
    notifyListeners();
  }

  void stopFetching() {
    _isFetching = false;
    notifyListeners();
  }

  void setErrors(message) {
    _errors = message;
    notifyListeners();
  }

  /// Fetch products data from the backend
  Future<dynamic> fetchOneProduct({
    @required int productId,
    // BuildContext context,
  }) async {
    String url = '${Api.productsUrl}/$productId';

    try {
      startFetching();
      http.Response response = await http.get(url);
      Map jsonResponse = convert.jsonDecode(response.body);

      if (jsonResponse['success']) {
        Map fetchedProduct = jsonResponse['data']['product'];
        // print(fetchedProduct);

        IProducts product = IProducts.fromMap(fetchedProduct);
        setProduct(product);
        stopFetching();

        return product;
      }

      stopFetching();
      return setErrors(jsonResponse['message']);
    } catch (e, stack) {
      print(e);
      print(stack);

      stopFetching();
      return setErrors('An error occured');
    }
  }
}
