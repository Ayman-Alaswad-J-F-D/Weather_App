// ignore_for_file: avoid_print
import 'dart:io';
import 'package:dio/dio.dart';

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
      } else if (e.isNoConnectionError) {
        print("Error Status Code ${e.response?.statusCode}");
        print("Error Response: ${e.response}");
        print("Error Message: ${e.message}");
      } else {
        print("Api Repo Error Status Code: ${e.response?.statusCode}");
        print("Api Repo Error Response: ${e.response}");
        print("Api Repo Error Message: ${e.message}");
        rethrow;
      }
    }
    // .catchError((error) {
    //   if (error != null) {
    //     onError!(error);
    //   }
    // });
  }
}

extension DioErrorX on DioError {
  bool get isNoConnectionError =>
      type == DioErrorType.other &&
      error is SocketException; // import 'dart:io' for SocketException
}
