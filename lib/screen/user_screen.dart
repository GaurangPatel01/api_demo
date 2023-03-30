import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/models/data.dart';
import 'package:loginscreen/network/api_call.dart';

class SingleUserScreen extends StatefulWidget {
  final Datum usersList;
  const SingleUserScreen({super.key, required this.usersList});

  @override
  State<SingleUserScreen> createState() => _SingleUserScreenState();
}

class _SingleUserScreenState extends State<SingleUserScreen> {
  @override
  void initState() {
    getSingleList(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('${widget.usersList.firstName}')),
      body: Center(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                  backgroundImage: NetworkImage(widget.usersList.avatar),
                  radius: 100),
              SizedBox(
                height: 20,
              ),
              Divider(thickness: 5),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.all(10.0),
                child: Padding(
                  padding: EdgeInsets.only(right: 50,left: 50,bottom: 5,top: 5),
                  child: Text(
                    'User ID : ${widget.usersList.id}'.toString(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.all(5.0),
                child: Padding(
                  padding: EdgeInsets.only(right: 50,left: 50,bottom: 5,top: 5),
                  child: Text('${widget.usersList.firstName}'
                      '${widget.usersList.lastName}',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  ),
                ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.all(5.0),
                child: Padding(
                  padding: EdgeInsets.only(right: 50,left: 50,bottom: 5,top: 5),
                  child:  Text(widget.usersList.email,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
                ),
              ),
            ]),
      ),
    );
  }

  void getSingleList(BuildContext context) async {
    var response = await ApiCall.requestGet(
        context, '/api/users/${widget.usersList.id.toString()}');
    print('response :$response');
  }
}
