//File created by mcedgar
//by 1:20 AM
//on 30/Sep/2019

import 'dart:convert';

import 'package:http/http.dart';

class HttpService {
  HttpService(this.baseUrl, [Client client]) : client = client ?? Client();
  final String baseUrl;
  final Client client;

  Future<dynamic> get(String path, {Map<String, String> headers}) async {
    final Response response =
        await client.get('$baseUrl$path', headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return Future<String>.error(response.body);
    }
  }
}
