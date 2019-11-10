import 'package:advertise_it/constants/api.dart';
import 'package:dio/dio.dart';

BaseOptions options = new BaseOptions(
  baseUrl: Api.baseUrl,
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

Dio httpService = new Dio(options);

setAuthHeaders(String authToken) {
  httpService.options.headers = {
    'Authorization': authToken,
  };
}
