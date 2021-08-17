// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_login_using_firebase/authentication.dart';
import 'package:simple_login_using_firebase/signup.dart';
import 'success.dart';

class Login extends StatefulWidget {

  //const Login({ Key key }) : super(key: key);

  
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  

  //final GlobalKey<FormState> _formKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase App'),
        centerTitle: true,
        actions: <Widget>[
          TextButton.icon( 
            icon: Icon(Icons.person_add,color: Colors.black,), 
            label: Text('Register',style: TextStyle(color: Colors.white),),
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16,right: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 50,),
              Center(
                child: Text('LOGIN PAGE',
                style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,letterSpacing: 2.0),
                ),
              ),
              SizedBox(height:60 ,),
              TextFormField(
                // ignore: missing_return
                validator: (value){
                  if(value.isEmpty || !value.contains('@gmail')){
                    return 'Please Enter Valid Email Address';
                  }
                  email = value;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  labelText: 'Email Address',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red)
                  )

                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                
                // ignore: missing_return
                validator: (value){
                  if(value.isEmpty){
                    return 'Required';
                  }
                  password = value;
                },
                obscureText: _obscureText,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelStyle: TextStyle(fontSize: 16,),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red)
                  ) ,
                  suffixIcon:new GestureDetector(
                    onTap: (){
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: new Icon(
                      _obscureText
                      ? Icons.visibility
                      : Icons.visibility_off
                    ),
                  ),
                  labelText: 'Password',
                  
                ),
              ),
              SizedBox(height: 20,),
              TextButton(
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    bool _isSuccess = await Authentication().singIn(email, password);
                    if(_isSuccess){
                      //FirebaseAuth.instance.currentUser.
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Success(FirebaseAuth.instance.currentUser.displayName)));
                    }
                    else{
                      print('null');
                    }
                  }
                }, 
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff039dfc),
                        Color(0xff2a8dc9),
                        Color(0xff5ca2cc)
                      ],
                    )
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(maxWidth: double.infinity,minHeight: 50),
                    child: Text('LOGIN',
                    style: TextStyle(fontSize: 20,color: Colors.white),
                  ),
                )
                ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}