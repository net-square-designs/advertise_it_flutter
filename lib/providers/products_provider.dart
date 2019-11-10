import 'dart:async';
import 'package:advertise_it/models/pagination_meta.interface.dart';
import 'package:advertise_it/models/products.interface.dart';
import 'package:advertise_it/services/http.service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

enum OrderDirection { ASC, DESC }

class ProductsProvider extends ChangeNotifier {
  /// Private provider state properties
  int _nextPage = 1;
  int _startPage = 1;
  bool _isFetching = true;
  IPaginationMeta _paginationMeta;

  Map<String, String> _errors = {};
  List<IProducts> _products = [];
  int get nextPage => _nextPage;
  int get startPage => _startPage;

  /// Public provider state getters
  OrderDirection get orderDirection => OrderDirection.ASC;
  bool get isFetching => _isFetching;
  Map get errors => _errors;
  IPaginationMeta get paginationData => _paginationMeta;
  List<IProducts> get products => _products;

  ProductsProvider() {
    // fetchProducts(page: 1, pageSize: 10);
  }

  /// Public provider setters
  void setProducts(List<IProducts> productsList) {
    _products = productsList;
    notifyListeners();
  }

  void updateProductList(IProducts product) {
    final updatedProductsList = _products.map(
      (thisProduct) {
        if (thisProduct.id == product.id) {
          return thisProduct = product;
        }
        return thisProduct;
      },
    ).toList();

    Future.delayed(Duration.zero, () {
      _products = updatedProductsList;
      notifyListeners();
    });
  }

  void startFetching() {
    _isFetching = true;
    notifyListeners();
  }

  void stopFetching() {
    _isFetching = false;
    notifyListeners();
  }

  setMetaData(Map metaData, bool isFresh) {
    _paginationMeta = IPaginationMeta.fromMap(metaData);
    if (isFresh) {
      _nextPage = _startPage + 1;
      return notifyListeners();
    }
    if (_nextPage <= _paginationMeta.totalPages) {
      _nextPage = _nextPage + 1;
      return notifyListeners();
    }
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
    bool isFresh = false,
    BuildContext context,
  }) async {
    String direction = orderDirection == OrderDirection.ASC ? 'ASC' : 'DESC';
    String url = '/product?page=$page&pageSize=$pageSize'
        '&orderBy=$orderBy&direction=$direction';

    try {
      startFetching();
      Response response = await httpService.get(url);
      Map jsonResponse = response.data;

      if (jsonResponse['success']) {
        List fetchedProducts = jsonResponse['data']['products'];
        Map metaData = jsonResponse['data']['metaData'];

        List<IProducts> productsList = fetchedProducts.map((product) {
          return IProducts.fromMap(product);
        }).toList();

        setMetaData(metaData, isFresh);
        print('isFresh: $isFresh' ': $_nextPage');
        stopFetching();
        if (isFresh) {
          return setProducts(productsList);
        }
        return addProducts(productsList);
      }

      stopFetching();
    } on DioError catch (e, stack) {
      print(e);
      print(stack);
      stopFetching();

      if (e.response.data != null) {
        return setErrors(e.response.data['message']);
      }

      return setErrors('An error occured');
    }
  }
}
