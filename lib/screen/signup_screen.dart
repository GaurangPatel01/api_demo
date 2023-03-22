import 'package:flutter/material.dart';

import '../network/api_call.dart';
import '../utils/route.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  void initState() {
    var url = '/api/users?page=2';
    dynamic sample = ApiCall.requestget(context,url);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder:(context,index){
          return Container(
            height: double.infinity,
            color: Colors.purple,
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('id '),
                Text('email'),
                Text('first_name'),
                Text('last_name'),
                Text('avatar'),
              ],
            ),
          );
        },
        ),
    );
  }
}
