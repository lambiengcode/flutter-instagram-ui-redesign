import 'package:http/http.dart' as http;
import 'package:whoru/src/app.dart';
import 'dart:async';
import 'package:whoru/src/common/routes.dart';

class BaseRepository {
  Future<http.Response> postRoute(String gateway, Object body) async {
    var response = http.post(
      Uri.http(baseUrl, gateway),
      body: body,
      headers: getHeaders(),
    );
    printEndpoint('POST', gateway);
    return response;
  }

  Future<http.Response> putRoute(String gateway, Object body) async {
    var response = http.put(
      Uri.http(baseUrl, gateway),
      body: body,
      headers: getHeaders(),
    );
    printEndpoint('POST', gateway);
    return response;
  }

  Future<http.Response> getRoute(
      String gateway, Map<String, String> paramsObject) async {
    var response = http.get(
      Uri.http(baseUrl, gateway, paramsObject),
      headers: getHeaders(),
    );
    printEndpoint('POST', gateway);
    return response;
  }

  Future<http.Response> deleteRoute(String gateway, Object body) async {
    var response = http.delete(
      Uri.http(baseUrl, gateway),
      body: body,
      headers: getHeaders(),
    );
    printEndpoint('POST', gateway);
    return response;
  }

  Map<String, String> getHeaders() {
    return {
      'authorization': 'Bearer ${App.token}',
    };
  }

  printEndpoint(String method, String endpoint) {
    print('${method.toUpperCase()}: $endpoint');
  }
}
