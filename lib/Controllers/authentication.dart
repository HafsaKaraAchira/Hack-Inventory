import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hack_inventory/Models/UserModel.dart';


class AuthenticationHelper{
  
  final FirebaseAuth _auth ;//= FirebaseAuth.instance;
  UserModel userModel = UserModel();
  final userRef = FirebaseFirestore.instance.collection("users");
  
  AuthenticationHelper(this._auth);

  //getters 
  Stream<User> get authStateChanges => _auth.authStateChanges();
  get user => _auth.currentUser;

  //SIGN UP
  Future signUp({String email,String password}) async{
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
      return "Signed Up" ;
    } on FirebaseAuthException catch(e){
      return e.message ;
    } 
  }//SIGN UP

  //SIGN IN
  Future signIn({String email,String password}) async{
    try {
      await _auth.signInWithEmailAndPassword(email: email,password: password);
      return "Signed In" ;
    } on FirebaseAuthException catch (e){
      return e.message;
    }
  }//SIGN IN

  //SIGN OUT
  Future signOut() async {
    await _auth.signOut();
    print('signout');
  }//SIGN OUT

  Future<void> addUserToDB(
    {String uid ,String username,String email, DateTime timestamp}) async {
      userModel = UserModel(
        uid:uid,username:username,email:email,timestamp:timestamp);
      return await userRef.doc(uid).set(userModel.toMap(userModel));
    }//addUserToDB

  Future<UserModel> getUserFromDB({String uid}) async {
    final DocumentSnapshot doc = await userRef.doc(uid).get();
    print(doc.data());
    return UserModel.fromMap(doc.data()) ;
  }//getUserFromDB

}//end euthentication Helper