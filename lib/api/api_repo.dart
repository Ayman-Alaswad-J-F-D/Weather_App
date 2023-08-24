// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiRepo {
  final String? url;
  final Map<String, dynamic>? paylod;

  ApiRepo({required this.url, required this.paylod});

  final Dio _dio = Dio(BaseOptions(receiveDataWhenStatusError: true));

  void getData({
    Function()? beforeSend,
    Function(Map<String, dynamic> data)? onSaccess,
    Function(Map<String, dynamic> error)? onError,
  }) async {
    try {
      await _dio.get(url!, queryParameters: paylod).then((response) {
        if (onSaccess != null) {
          if (response.statusCode == 200) onSaccess(response.data);
        }
      });
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        print("Error Status Code ${e.response?.statusCode}");
        onError!(e.response?.data);
      } else {
        print("Api Repo Error ${e.response?.statusCode}");
        print("Api Repo Error ${e.response}");
        print("Api Repo Error ${e.message}");
      }
    }
    // .catchError((error) {
    //   if (error != null) {
    //     onError!(error);
    //   }
    // });
  }
}
