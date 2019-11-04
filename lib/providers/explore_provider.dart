// import 'package:advertise_it/mocks/products.dart';
// import 'package:advertise_it/models/products.interface.dart';
import 'package:advertise_it/models/categories.interface.dart';
import 'package:flutter/material.dart';

class ExploreProvider extends ChangeNotifier {
  List<ICategories> _categories = [];

  ExploreProvider() {
    fetchCategories();
  }

  List<ICategories> get categories => _categories;

  void setCategories(List<ICategories> categoriesList) {
    _categories = categoriesList;
    notifyListeners();
  }

 
  /// add more categories
  void addCategories(List<ICategories> categoriesList) {
    _categories.addAll(categoriesList);
    notifyListeners();
  }

  /// Fetch categories data from the backend
  Future<List<ICategories>> fetchCategories() async {
    List categoriesArray;
    List<ICategories> categoriesList;

    if (categoriesArray.length > 0) {
      categoriesList = categoriesArray.map((category) {
        return ICategories.fromMap(category);
      }).toList();

      setCategories(categoriesList);
    }

    return categoriesList;
  }
}
