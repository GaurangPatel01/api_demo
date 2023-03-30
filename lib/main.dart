import 'package:flutter/material.dart';
import 'package:loginscreen/screen/login_screen.dart';
import 'package:loginscreen/screen/signup_screen.dart';
import 'package:loginscreen/screen/splash_screen.dart';
import 'package:loginscreen/screen/user_screen.dart';
import 'package:loginscreen/utils/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get userListo => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api Call Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:SplashScreen(),
      routes: {
        Routes.loginScreen:(context) =>LoginScreen(),
        Routes.signUp:(context)=>SignUpScreen(),
        Routes.singleuser:(context)=> SingleUserScreen(usersList:userListo ),

      },
    );
  }
}


