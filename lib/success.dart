import 'package:flutter/material.dart';
import 'package:simple_login_using_firebase/login.dart';

// ignore: must_be_immutable
class Success extends StatefulWidget {
  //const Success({ Key key }) : super(key: key);

  // String email;
  // String password;
  String name;
  Success(this.name);
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {

  _SuccessState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase App'),
        actions: [
          TextButton.icon(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
            },
            label: Text('Sign Out',style: TextStyle(color: Colors.white),),
            icon: Icon(Icons.person,color: Colors.black,),
          ),
        ]
      ),
      body: Center(
        child: Text(widget.name,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
        ),
    );
  }
}