import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loginscreen/network/api.dart';
import 'package:loginscreen/network/api_call.dart';

import '../utils/image_url.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(
            children: [
              Image.asset(
                ImageUrl.applogo,
                fit: BoxFit.fill,
                height: 80,
                width: 300,
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    TextField(
                      controller: emailController,
                      focusNode: emailFocus,
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.email_sharp),
                          labelText: 'Email',
                          hintText: 'Email Address',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: passwordController,
                      focusNode: passwordFocus,
                      autofocus: false,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.remove_red_eye),
                          labelText: 'Password',
                          hintText: 'Password ',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15), // <-- Radius
                            ),
                          ),

                          onPressed: () async {
                            var url = '/api/login';
                            var body = {
                              "email": emailController.text,
                              "password": passwordController.text
                            };
                            setState(() {
                              ApiCall.request(context,body,url);
                            });
                            // makePostRequest();
                          },
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )),
                    )
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

 /* Future<void> makePostRequest() async {
    final url = Uri.parse('https://reqres.in/api/register');
    final json = {
      'email': 'eve.holt@reqres.in',
      'password': 'pistol'
    };
    try {
      final response = await http.post(url, body:json);
      if (response.statusCode == 200) {
        final result = response.body;
        print('ID: ${jsonDecode(result)}');
        var res = jsonDecode(result);
        print('Id.....: ${res['id']}');
        print('Token: ${result}');
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Request failed with error: $e.');
    }
  }*/

}
