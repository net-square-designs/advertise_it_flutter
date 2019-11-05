import 'dart:async';

import 'package:advertise_it/constants/api.dart';
import 'package:advertise_it/models/user.interface.dart';
import 'package:advertise_it/utils/jwt_helper.dart';
import 'package:advertise_it/widgets/Toaster/toaster.dart';
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
    context,
  }) async {
    http.Response response;
    try {
      response = await http.post(
        Api.loginUrl,
        body: {'email': email, 'password': password},
      );

      var jsonResponse = convert.jsonDecode(response.body);

      if (jsonResponse['statusCode'] == 200) {
        successToaster(context, 'You have logged in successfully');

        Timer(
          Duration(seconds: 2),
          () => setAuthUser(jsonResponse['data']['token']),
        );
      }

      if (jsonResponse['statusCode'] == 400) {
        final String errorMsg = jsonResponse['errors']['detailsObject']
                ['email'] ??
            jsonResponse['errors']['detailsObject']['password'];

        return errorToaster(context, errorMsg);
      }

      return errorToaster(context, jsonResponse['message']);
    } catch (e, stack) {
      print(e);
      print(stack);
      return errorToaster(
        context,
        'An error occured while process your request. Please try again in a moment',
      );
    } finally {}
  }

  Future<dynamic> signupUser({
    @required String firstName,
    @required String email,
    @required String password,
    context,
  }) async {
    http.Response response;
    try {
      response = await http.post(
        Api.signupUrl,
        body: {
          'email': email,
          'password': password,
          'firstName': firstName,
          'accountType': 'Customer',
        },
      );

      var jsonResponse = convert.jsonDecode(response.body);

      if (jsonResponse['statusCode'] == 200) {
        successToaster(context, 'Your account was created successfully');

        Timer(
          Duration(seconds: 2),
          () => setAuthUser(jsonResponse['data']['token']),
        );
      }

      if (jsonResponse['statusCode'] == 400) {
        print(jsonResponse['errors']);
        final String errorMsg = jsonResponse['errors']['detailsObject']
                ['firstName'] ??
            jsonResponse['errors']['detailsObject']['email'] ??
            jsonResponse['errors']['detailsObject']['password'];

        return errorToaster(context, errorMsg);
      }

      return errorToaster(context, jsonResponse['message']);
    } catch (e, stack) {
      print(e);
      print(stack);
      return errorToaster(
        context,
        'An error occured while process your request. Please try again in a moment',
      );
    } finally {}
  }
}
