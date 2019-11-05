import 'package:advertise_it/constants/api.dart';
import 'package:advertise_it/models/user.interface.dart';
import 'package:advertise_it/utils/jwt_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String _authToken;
  IUser _authUser;

  AuthProvider() {
    initTokens();
  }

  String get authToken => _authToken;
  IUser get user => _authUser;

  void setAuthToken(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('authToken', token);

    _authToken = token;
    notifyListeners();
  }

  void setAuthUser(String token) {
    final userData = IUser.fromMap(parseJwt(token));

    // print(parseJwt(token));

    setAuthToken(token);
    _authUser = userData;

    notifyListeners();
  }

  void initTokens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _token = prefs.getString('authToken');

    if (_token != null) {
      setAuthUser(_token);
    }
  }

  Future<dynamic> loginUser({
    @required String email,
    @required String password,
  }) async {
    http.Response response;
    try {
      response = await http.post(
        Api.loginUrl,
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
