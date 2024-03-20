import 'dart:convert';

import 'package:http/http.dart' as http;
class RestService{
  final String _baseUrl;
  final String _key;

  const RestService({required baseUrl, required key}): _baseUrl = baseUrl, _key =  key;

  Future get(String endPoint) async {
    final response = await http.get(
      Uri.parse("$_baseUrl/$endPoint"),
      headers: {
        "Authorization" : _key,
        "Content-Type" : "application/json",
      },
    );

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    throw response.statusCode;
  }
}