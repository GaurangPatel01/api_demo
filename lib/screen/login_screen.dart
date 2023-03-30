import 'package:flutter/material.dart';
import 'package:loginscreen/network/api_call.dart';
import '../utils/image_url.dart';
import 'package:http/http.dart' as http;

import '../utils/route.dart';

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
    return Scaffold(
      backgroundColor: Colors.grey,
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
                    TextFormField(
                      controller: emailController..text = 'eve.holt@reqres.in',
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
                    TextFormField(
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
                              borderRadius:
                                  BorderRadius.circular(15), // <-- Radius
                            ),
                          ),
                          onPressed: () async {
                            if (emailController.text == '') {
                              print('Please enter email');
                            } else if (passwordController.text == '') {
                              print('Please enter password');
                            } else if (emailController.text ==
                                    'eve.holt@reqres.in' ||
                                passwordController.text == 'cityslicka') {
                              var url = '/api/login';
                              var body = {
                                "email": emailController.text,
                                "password":passwordController.text,
                              };
                              setState(() {
                                ApiCall.request(context, body, url)
                                    .then((value) {
                                        Navigator.pushNamed(context, Routes.signUp);
                                        // print(Routes.signUp);
                                });
                              });
                            } else {
                              print('Please enter valid email or Password!');
                            }
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
}
