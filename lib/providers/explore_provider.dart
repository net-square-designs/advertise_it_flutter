import 'package:advertise_it/models/categories.interface.dart';
import 'package:advertise_it/services/http.service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ExploreProvider extends ChangeNotifier {
  List<ICategories> _categories = [];
  bool _isFetching = true;
  Map<String, String> _errors = {};

  ExploreProvider() {
    fetchCategories();
  }

  List<ICategories> get categories => _categories;
  bool get isFetching => _isFetching;

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

  void setCategories(List<ICategories> categoriesList) {
    _categories = categoriesList;
    notifyListeners();
  }

  /// add more categories
  void addCategories(List<ICategories> categoriesList) {
    _categories.addAll(categoriesList);
    notifyListeners();
  }

  void setErrors(message) {
    _errors['message'] = message;
    notifyListeners();
  }

  /// Fetch categories data from the backend
  Future<void> fetchCategories() async {
    // print('called fetchCategories');
    // String url = Api.categoriesUrl;

    setCategories([]);

    try {
      startFetching();

      Response response = await httpService.get('/category');
      Map jsonResponse = response.data;

      stopFetching();

      if (jsonResponse['success']) {
        List fetchedCategories = jsonResponse['data']['categories']['rows'];

        List<ICategories> categoriesList = fetchedCategories.map((category) {
          return ICategories.fromMap(category);
        }).toList();

        return setCategories(categoriesList);
      }

      return setErrors(jsonResponse['message']);
    } catch (e, stack) {
      print(e);
      print(stack);
      stopFetching();
      return setErrors('An error occured');
    }
  }
}
