import 'dart:async';

import 'package:advertise_it/constants/api.dart';
import 'package:advertise_it/models/pagination_meta.interface.dart';
import 'package:advertise_it/models/products.interface.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

enum OrderDirection { ASC, DESC }

class ProductsProvider extends ChangeNotifier {
  /// Private provider state properties
  int _nextPage = 1;
  bool _isFetching = true;
  IPaginationMeta _paginationMeta;

  Map<String, String> _errors = {};
  List<IProducts> _products = [];
  int get nextPage => _nextPage;

  /// Public provider state getters
  OrderDirection get orderDirection => OrderDirection.ASC;
  bool get isFetching => _isFetching;
  Map get errors => _errors;
  IPaginationMeta get paginationData => _paginationMeta;
  List<IProducts> get products => _products;

  ProductsProvider() {
    fetchProducts(page: 1, pageSize: 10);
  }

  void setNextPage() {
    _nextPage = _nextPage + 1;
    notifyListeners();
  }

  /// Public provider setters
  void setProducts(List<IProducts> productsList) {
    _products = productsList;
    notifyListeners();
  }

  void startFetching() {
    // print('called start fetching');
    _isFetching = true;
    notifyListeners();
  }

  void stopFetching() {
    // print('called stop fetching');
    _isFetching = false;
    notifyListeners();
  }

  setMetaData(Map metaData) {
    _paginationMeta = IPaginationMeta.fromMap(metaData);
    notifyListeners();
  }

  /// add more products
  void addProducts(List<IProducts> productList) {
    _products.addAll(productList);
    notifyListeners();
  }

  void setErrors(message) {
    _errors['message'] = message;
    notifyListeners();
  }

  /// Fetch products data from the backend
  Future<dynamic> fetchProducts({
    @required int page,
    @required int pageSize,
    String orderBy = 'id',
    OrderDirection orderDirection = OrderDirection.DESC,
    BuildContext context,
  }) async {
    String direction = orderDirection == OrderDirection.ASC ? 'ASC' : 'DESC';
    String url = '${Api.productsUrl}?page=$page&pageSize=$pageSize'
        '&orderBy=$orderBy&direction=$direction';

    try {
      startFetching();

      http.Response response = await http.get(url);
      Map jsonResponse = convert.jsonDecode(response.body);

      if (jsonResponse['success']) {
        List fetchedProducts = jsonResponse['data']['products'];
        Map metaData = jsonResponse['data']['metaData'];

        setNextPage();
        setMetaData(metaData);

        List<IProducts> productsList = fetchedProducts.map((product) {
          return IProducts.fromMap(product);
        }).toList();

        stopFetching();
        if (_products.length == 0) {
          return setProducts(productsList);
        }
        return addProducts(productsList);
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
