import 'package:flutter/material.dart';
import 'package:simple_login_using_firebase/authentication.dart';
import 'package:simple_login_using_firebase/login.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  String name,email,password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase App'),
        centerTitle: true,
        actions: <Widget>[
          TextButton.icon(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
            }, 
            icon: Icon(Icons.login,color: Colors.black,), 
            label: Text('Login',style: TextStyle(color: Colors.white),))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 16,right: 16,),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    'SIGNUP PAGE',
                    style: TextStyle(
                      letterSpacing: 2.0, fontWeight: FontWeight.bold,fontSize: 20.0),
                  ),
                ),
                SizedBox(height: 30,),
                TextFormField(
                  // ignore: missing_return
                  validator: (value){
                    if(value.isEmpty){
                      return 'Enter Name';
                    }
                    name = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon:Icon(Icons.person) ,
                    labelText: 'Enter Name',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.red),
                    )
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  // ignore: missing_return
                  validator: (value){
                    if(value.isEmpty || !value.contains('@gmail')){
                      return 'Enter Valid Email';
                    }
                    email = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    labelText: 'Email Address',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.red),
                    )
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  // ignore: missing_return
                  validator: (value){
                    if(value.isEmpty){
                      return 'Enter Valid Password';
                    }
                    password = value;
                  },
                  obscureText:_obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: new GestureDetector(
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
                    )
                  ),
                ),
                SizedBox(height: 20,),
                TextButton(
                  onPressed: (){

                    if(_formKey.currentState.validate()){
                      Authentication().signUp(name, email, password);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
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
                      constraints: BoxConstraints(
                        maxWidth: double.infinity,maxHeight: 50
                      ),
                      child: Text('REGISTER',style: TextStyle(fontSize: 20,color: Colors.white),),
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
