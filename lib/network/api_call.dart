import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

class ApiCall {
  static Future<dynamic> request(
      BuildContext context, dynamic body, String endpoint) async {
    try {
      var url = Apis.baseUrl + endpoint;
      var response =
          await http.post(Uri.parse(url), body: body);
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

 static Future<dynamic> requestGet(
     BuildContext context, String endpoint)async{
    try{
      var url = Apis.baseUrl+endpoint;
      var response = await http.get(Uri.parse(url));
      print('responses: ${response.runtimeType}');
      if(response.statusCode == 200){
        var result = jsonDecode(response.body);
        return result;
      }
      else{
        print('Else condition');
      }
    }catch(error){
      print('error: $error');
    }
 }
}
