import 'dart:async';

import 'package:advertise_it/constants/api.dart';
import 'package:advertise_it/models/user.interface.dart';
import 'package:advertise_it/screens/Home/home_screen.dart';
import 'package:advertise_it/services/http.service.dart';
import 'package:advertise_it/utils/jwt_helper.dart';
import 'package:advertise_it/widgets/Toaster/toaster.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String _authToken;
  IUser _authUser;

  AuthProvider() {
    initTokens();
  }

  String get authToken => _authToken;
  IUser get user => _authUser;

  void setAuthToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('authToken', token);

    setAuthHeaders(token);

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
    try {
      Response response = await httpService
          .post(Api.loginUrl, data: {'email': email, 'password': password});

      Map jsonResponse = response.data;

      if (jsonResponse['statusCode'] == 200) {
        successToaster(context, 'You logged in successfully');

        return Timer(Duration(seconds: 2), () {
          setAuthUser(jsonResponse['data']['token']);
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        });
      }
    } on DioError catch (e, stack) {
      print(e);
      print(stack);

      if (e.response.data != null) {
        if (e.response.data['statusCode'] == 400) {
          final String errorMsg = e.response.data['errors']['detailsObject']
                  ['email'] ??
              e.response.data['errors']['detailsObject']['password'];

          return errorToaster(context, errorMsg);
        }
      } else {
        return errorToaster(
          context,
          'An error occured while process your request. Please try again in a moment',
        );
      }
    } finally {}
  }

  Future<dynamic> signupUser({
    @required String firstName,
    @required String email,
    @required String password,
    @required String phone,
    context,
  }) async {
    try {
      Response response = await httpService.post(Api.signupUrl, data: {
        'email': email,
        'password': password,
        'firstName': firstName,
        'phone': phone,
        'accountType': 'Customer',
      });

      Map jsonResponse = response.data;

      successToaster(context, 'Your account was created successfully');

      return Timer(Duration(seconds: 2), () {
        setAuthUser(jsonResponse['data']['token']);
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      });
    } on DioError catch (e, stack) {
      print(e);
      print(stack);

      if (e.response.data != null) {
        if (e.response.data['statusCode'] == 400) {
          print(e.response.data['errors']);
          final String errorMsg = e.response.data['errors']['detailsObject']
                  ['firstName'] ??
              e.response.data['errors']['detailsObject']['email'] ??
              e.response.data['errors']['detailsObject']['password'];

          return errorToaster(context, errorMsg);
        }
        return errorToaster(context, e.response.data['message']);
      }

      return errorToaster(
        context,
        'An error occured while process your request. Please try again in a moment',
      );
    } finally {}
  }
}
