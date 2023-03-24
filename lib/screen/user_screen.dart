import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/network/api_call.dart';
import 'package:loginscreen/screen/signup_screen.dart';

import '../models/Singleuser.dart';

class SingleUserScreen extends StatefulWidget {
  const SingleUserScreen({Key? key}) : super(key: key);

  @override
  State<SingleUserScreen> createState() => _SingleUserScreenState();
}

class _SingleUserScreenState extends State<SingleUserScreen> {
  List<Data> userSingleList = <Data>[];
  // var _isLoading = false;
  @override
  void initState() {
    getSingleList(context,'id');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SignUpScreen;
    return Scaffold(
      appBar: AppBar(
        title: Text('Single List'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: userSingleList.length,
                itemBuilder: (BuildContext context, index) {
                  child:
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox.fromSize(
                            size: const Size.fromRadius(48),
                            child: Image.network(
                              userSingleList[index].avatar,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text('Id : ${userSingleList[index].id}'),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('${userSingleList[index].firstName}'
                              '${userSingleList[index].lastName}'),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(userSingleList[index].email),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  void getSingleList(BuildContext context, String id) async {
    try {
      var response = await ApiCall.requestGet(context, '/api/users/$id');
      print('resonse : $response');
      userSingleList.clear();
      List<Data> list =
      response["data"].map<Data>((json) => Data.fromJson(json)).toList();
      print('response: $response');
      print('list: $list');
      userSingleList.addAll(list);
    } finally{
      print('Error....');
    }
  }
}
