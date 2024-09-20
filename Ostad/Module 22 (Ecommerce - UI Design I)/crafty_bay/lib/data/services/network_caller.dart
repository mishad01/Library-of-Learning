import 'dart:convert';

import 'package:crafty_bay/data/model/network_response.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetworkCaller {
  final Logger logger;

  NetworkCaller({required this.logger});
  Future<NetworkResponse> _getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      logger.i(url);
      final Response response = await get(uri, headers: {
        'token': '',
      });
      if (response.statusCode == 200) {
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: true,
            responseData: decodedBody);
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> _postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      final Response response = await post(
        uri,
        headers: {
          'token': '',
          'content-type': 'application/json',
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: true,
            responseData: decodedBody);
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  void requestLog(
    String url,
    Map<String, dynamic> params,
    Map<String, dynamic> body,
    String tokens,
  ) {
    logger.i('''
    Url : $url,
    Params : $params,
    Body : $body,
    Token:$tokens
    
    ''');
  }

  void responseLog(
      String url,
      String statusCode,
      Map<String, dynamic> responseBody,
      Map<String, dynamic> headers,
      bool isSuccess) {
    String message = '''
    Url : $url,
    Status Code : $statusCode,
    Response Body :$responseBody,
    Headers : $headers,
    ''';
    if (isSuccess) {
      logger.i(message);
    } else {
      logger.e(message);
    }
  }
}
