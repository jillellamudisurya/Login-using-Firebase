// import 'package:flutter/material.dart';
// import 'package:simple_login_using_firebase/login.dart';

// class Log extends StatefulWidget {
//   const Log({ Key key }) : super(key: key);

//   @override
//   _LogState createState() => _LogState();
// }

// class _LogState extends State<Log> {

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Log'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             TextFormField(
//               // ignore: missing_return
//               validator: (value){
//                 if(value.isEmpty){
//                   return 'Invalid';
//                 }
//               },
//               decoration: InputDecoration(
//                 labelText: 'Enter Email',
//               ),
//             ),
//             TextFormField(
//               // ignore: missing_return
//               validator: (value){
//                 if(value.isEmpty){
//                   return 'invalid';
//                 }
//               },
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//               ),
//             ),
//             TextButton(
//               onPressed: (){
//                 if(_formKey.currentState.validate()){
//                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
//                 }
//               }, 
//               child: Text('Login')
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }