import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  String _authToken;

  String get authToken => _authToken;

  void setAuthToken(token) {
    _authToken = token;
    notifyListeners();
  }

  Future<http.Response> loginUser({@required String email, @required String password}) async {
    return await http.get('https://jsonplaceholder.typicode.com/posts/1');
  }
}
