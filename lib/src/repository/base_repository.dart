import 'package:get/get.dart' as getx;
import 'package:dio/dio.dart' as diox;
import 'package:provider/provider.dart';
import 'package:whoru/src/common/routes.dart';
import 'dart:convert' as convert;
import 'dart:async';
import 'package:whoru/src/providers/account_provider.dart';

class BaseRepository {
  var dio = diox.Dio(diox.BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  )); // with default Options

  Future<diox.Response<dynamic>> downloadFile(
      String url, String path, Function onReceive) async {
    var response = await dio.download(
      url,
      path,
      onReceiveProgress: onReceive,
    );
    return response;
  }

  Future<diox.Response<dynamic>> sendFormData(
    String gateway,
    diox.FormData formData,
    Function onSend,
  ) async {
    var response = await dio.post(
      gateway,
      data: formData,
      onSendProgress: onSend,
    );
    return response;
  }

  Future<diox.Response<dynamic>> postRoute(String gateway, Object body) async {
    var response = await dio.post(
      gateway,
      data: body,
    );
    printEndpoint('POST', gateway);
    return response;
  }

  Future<diox.Response<dynamic>> putRoute(String gateway, Object body) async {
    var response = await dio.put(
      gateway,
      data: body,
    );
    printEndpoint('PUT', gateway);
    return response;
  }

  Future<diox.Response<dynamic>> getRoute(String gateway, String params) async {
    var response = await dio.get(
      gateway + params,
    );
    printEndpoint('GET', gateway);
    printResponse(response);
    return response;
  }

  Future<diox.Response<dynamic>> deleteRoute(
      String gateway, Object body) async {
    var response = await dio.delete(
      gateway,
      data: body,
    );
    printEndpoint('DELETE', gateway);
    return response;
  }

  Map<String, String> getHeaders() {
    return {
      'Authorization':
          'Bearer ${Provider.of<AccountProvider>(getx.Get.context, listen: false).accessToken}',
    };
  }

  printEndpoint(String method, String endpoint) {
    print('${method.toUpperCase()}: $endpoint');
  }

  printResponse(diox.Response<dynamic> response) {
    print('StatusCode: ${response.statusCode}');
    print('Body: ${convert.jsonDecode(response.data)}');
  }
}
