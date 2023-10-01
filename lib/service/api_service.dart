import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../model/gaming_name.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _init();
  }

  void _init() => _dio.interceptors.addAll([
        LogInterceptor(
            responseBody: kDebugMode,
            requestBody: kDebugMode,
            logPrint: (object) =>
                kDebugMode ? log('Dio Log: ${object.toString()}') : null),
      ]);

  Future<List<GamingName>> getAllFreeGame() async {
    final Response response =
        await _dio.get('https://www.freetogame.com/api/games');
    if(kDebugMode){
      print(response.data);
    }
    try {
      if(kDebugMode){
        print(response.data);
      }
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return [for (var e in response.data as List) GamingName.fromJson(e)];

      }
      throw UnknownException();
    } on Exception catch (e) {
      throw DioFailure(massage: e.toString());
    }
  }
}

class UnknownException implements Exception {}

class DioFailure implements Exception {
  DioFailure({this.statusCode, this.massage});

  final int? statusCode;
  final String? massage;
}
