import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

class ApiCall {
  static Future<dynamic> request(
      BuildContext context, dynamic body, String endpoint) async {
    try {
      var response =
          await http.post(Uri.parse(Apis.baseUrl + endpoint), body: body);

      print(response);
      print('${Apis.baseUrl}$endpoint');
      print(body);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result['token']);
        return result;
      } else {
        print('Api Error');
      }
    } catch (e) {
      print('Error ${e.toString()}');
    }
  }

  static Future<dynamic> requestget(
      BuildContext context, String endpoint) async {
    try {
      var response = await http.get(
        Uri.parse(Apis.baseUrl + endpoint),
      );
      print(response);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        // print(result['token']);
      } else {
        print('Api Error');
      }
    } catch (e) {
      print('Error ${e.toString()}');
    }
  }

/*static Future<void> makePostRequest(String endPoint) async {
    final url = Uri.parse('${Apis.baseUrl}$endPoint');
    print('MainUrl....${url}');
    final json = {
      'email': 'eve.holt@reqres.in',
      'password': 'pistol'
    };
    try {
      final response = await http.post(url, body:json);
      if (response.statusCode == 200) {
        final result = response.body;
        var res = jsonDecode(result);
        print('Response : $res');
        print('Id.....: ${res['id']}');
        print('Token: ${res['token']}');
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Request failed with error: $e.');
    }
}*/
}
