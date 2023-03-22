import 'package:flutter/material.dart';
import 'package:loginscreen/utils/image_url.dart';
import 'package:loginscreen/utils/route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, Routes.loginScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Image.asset(ImageUrl.applogo,fit:BoxFit.cover,),),
        ));
  }
}
