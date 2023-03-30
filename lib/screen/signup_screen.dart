import 'package:flutter/material.dart';
import 'package:loginscreen/network/api_call.dart';
import 'package:loginscreen/screen/user_screen.dart';


import '../models/data.dart';
import '../utils/route.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  List<Datum> userList = <Datum>[];
  var _isLoading = false;


  @override
  void initState() {
    getUserList(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User List')),
      body:_isLoading?
      Center(child: CircularProgressIndicator(),)
          : ListView.builder(
        shrinkWrap: true,
        itemCount: userList.length,
        itemBuilder: (context,index) {
          return InkWell(
            onTap: ()=> setState(() {
               Navigator.push(context,MaterialPageRoute(builder: (context) => SingleUserScreen(usersList:userList[index]),));
            }),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48),
                        child: Image.network(
                          userList[index].avatar,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Id : ${userList[index].id}'),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('${userList[index].firstName}'
                            '${userList[index].lastName}'),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(userList[index].email),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void getUserList(BuildContext context) async {
    try {
      setState(() {
        _isLoading = true;
      });
      var response = await ApiCall.requestGet(context, '/api/users?page=1');
      print('response :$response');
      userList.clear();
      List<Datum> list =
          response["data"].map<Datum>((json) => Datum.fromJson(json)).toList();
      userList.addAll(list);
    } finally{
      setState(() {
        _isLoading = false;
      });
    }
  }
}
