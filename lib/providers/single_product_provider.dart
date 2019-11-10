import 'dart:async';
import 'package:advertise_it/models/products.interface.dart';
import 'package:advertise_it/services/http.service.dart';
import 'package:advertise_it/widgets/Toaster/toaster.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

enum LikeType { ADD, REMOVE }

class SingleProductsProvider extends ChangeNotifier {
  bool _isFetching = true;

  String _errors;
  IProducts _product;
  bool _isLikedByUser = false;
  bool _isFollowing = false;

  /// Public provider state getters
  bool get isFetching => _isFetching;
  String get errors => _errors;
  IProducts get product => _product;
  bool get isLikedByUser => _isLikedByUser;
  bool get isFollowing => _isFollowing;

  SingleProductsProvider() {
    // fetchOneProduct();
  }

  /// Public provider setters
  void setProduct(IProducts product) {
    _product = product;
    notifyListeners();
  }

  void setIslikedByUser(bool isLikedByUser) {
    _isLikedByUser = isLikedByUser;
    notifyListeners();
  }

  void setIsFollowing(bool isFollowing) {
    _isFollowing = isFollowing;
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

  void setProductLikes(LikeType type) {
    final likes =
        type == LikeType.ADD ? _product.likes + 1 : _product.likes - 1;

    if (type == LikeType.ADD) {
      setIslikedByUser(true);
    }
    if (type == LikeType.REMOVE) {
      setIslikedByUser(false);
    }

    Future.delayed(Duration.zero, () {
      _product = IProducts(
        id: _product.id,
        title: _product.title,
        mediaUrl: _product.mediaUrl,
        views: _product.views,
        likes: likes,
        price: _product.price,
        productOwner: _product.productOwner,
        productImages: _product.productImages,
      );
      notifyListeners();
    });
  }

  /// Fetch products data from the backend
  Future<dynamic> fetchOneProduct({
    @required int productId,
    BuildContext context,
  }) async {
    String url = '/product/$productId';

    try {
      startFetching();
      Response response = await httpService.get(url);
      Map jsonResponse = response.data;

      if (jsonResponse['success']) {
        Map fetchedProduct = jsonResponse['data']['product'];
        bool isLikedByUser = jsonResponse['data']['isLikedByUser'];
        bool isFollowing = jsonResponse['data']['isFollowing'];

        IProducts product = IProducts.fromMap(fetchedProduct);
        setProduct(product);
        setIslikedByUser(isLikedByUser);
        setIsFollowing(isFollowing);

        stopFetching();

        return product;
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

  /// Post requestto like the product in view
  Future<dynamic> likeProduct({
    @required int productId,
    BuildContext context,
  }) async {
    String url = '/product/$productId/like';

    try {
      Response response = await httpService.post(url);
      Map jsonResponse = response.data;

      if (jsonResponse['success']) {
        String likeStatus = jsonResponse['data']['likeStatus'];

        if (likeStatus == 'liked') {
          return setProductLikes(LikeType.ADD);
        }
        return setProductLikes(LikeType.REMOVE);
      }
    } on DioError catch (e, stack) {
      print(e);
      print(stack);
      stopFetching();

      print(e.response);
      if (e.response != null) {
        return errorToaster(context, e.response.data['message']);
      }
      return errorToaster(context, 'An error occured');
    }
  }

  /// Post requestto like the product in view
  Future<dynamic> followSeller({
    @required int sellerId,
    BuildContext context,
  }) async {
    String url = '/follow/$sellerId';

    try {
      Response response = await httpService.post(url);
      Map jsonResponse = response.data;

      if (jsonResponse['success']) {
        setIsFollowing(true);
      }
    } on DioError catch (e, stack) {
      print(e);
      print(stack);
      stopFetching();

      print(e.response);
      if (e.response != null) {
        return errorToaster(context, e.response.data['message']);
      }
      return errorToaster(context, 'An error occured');
    }
  }
}
