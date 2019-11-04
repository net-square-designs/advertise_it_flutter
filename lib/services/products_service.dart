import 'package:advertise_it/mocks/products.dart';
import 'package:advertise_it/models/products.interface.dart';

class ProductsService {
  static List<IProducts> fetchProducts() {
    return getProducts().map((products) => IProducts.fromMap(products)).toList();
  }
}