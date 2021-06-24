import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import 'dart:async';
import 'package:whoru/src/common/routes.dart';
import 'package:whoru/src/providers/account_provider.dart';

class BaseRepository {
  Future<http.Response> postRoute(String gateway, Object body) async {
    var response = await http.post(
      Uri.http(baseUrl, gateway),
      body: body,
      headers: getHeaders(),
    );
    printEndpoint('POST', gateway);
    return response;
  }

  Future<http.Response> putRoute(String gateway, Object body) async {
    var response = await http.put(
      Uri.http(baseUrl, gateway),
      body: body,
      headers: getHeaders(),
    );
    printEndpoint('PUT', gateway);
    return response;
  }

  Future<http.Response> getRoute(
      String gateway, Map<String, String> paramsObject) async {
    var response = await http.get(
      Uri.http(baseUrl, gateway, paramsObject),
      headers: getHeaders(),
    );
    printEndpoint('GET', gateway);
    printResponse(response);
    return response;
  }

  Future<http.Response> deleteRoute(String gateway, Object body) async {
    var response = await http.delete(
      Uri.http(baseUrl, gateway),
      body: body,
      headers: getHeaders(),
    );
    printEndpoint('DELETE', gateway);
    return response;
  }

  Map<String, String> getHeaders() {
    return {
      'Authorization':
          'Bearer ${Provider.of<AccountProvider>(Get.context, listen: false).accessToken}',
    };
  }

  printEndpoint(String method, String endpoint) {
    print('${method.toUpperCase()}: $endpoint');
  }

  printResponse(http.Response response) {
    print('StatusCode: ${response.statusCode}');
    print('Body: ${convert.jsonDecode(response.body)}');
  }
}
