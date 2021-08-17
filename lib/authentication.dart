import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';


class Authentication{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<bool> signUp(String name,String email,String password) async {
    try {
    UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    User user = result.user;
    user.updateDisplayName(name);
    return true;
  } catch(e) {
    print(e.toString());
    return false;
  }
  }

  Future<bool> singIn(String email,String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    }
    catch(e){
      return false;
    }
  }
}