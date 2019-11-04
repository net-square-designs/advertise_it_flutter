import 'package:advertise_it/models/user.interface.dart';
import 'package:advertise_it/utils/jwt_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AuthProvider extends ChangeNotifier {
  String _authToken;
  IUser _authUser;

  AuthProvider() {
    // Todo
    /// 1. check for existing auth token
    /// 2. set the existing auth token
  }

  String get authToken => _authToken;
  IUser get user => _authUser;

  void setAuthToken(token) {
    _authToken = token;
    notifyListeners();
  }

  void setAuthUser(String token) {
    final userData = IUser.fromMap(parseJwt(token));

    print(parseJwt(token));

    setAuthToken(token);
    _authUser = userData;

    notifyListeners();
  }

  Future<dynamic> loginUser({
    @required String email,
    @required String password,
  }) async {
    http.Response response;
    try {
      response = await http.post(
        'http://localhost:4225/api/v1/auth/login',
        body: {'email': email, 'password': password},
      );

      var jsonResponse = convert.jsonDecode(response.body);

      if (jsonResponse['statusCode'] == 200) {
        return setAuthUser(jsonResponse['data']['token']);
      }

      return jsonResponse['message'];
    } catch (e, stack) {
      print(e);
      print(stack);
    } finally {}
  }
}
