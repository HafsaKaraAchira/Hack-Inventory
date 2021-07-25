import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_inventory/View/HomePage.dart';

//import 'package:hack_inventory/Controllers/authentication.dart';
//import 'package:provider/provider.dart';

class SignUpUser extends StatefulWidget {
  //SignUpUser({Key? key}) : super(key: key);

  @override
  _SignUpUserState createState() => _SignUpUserState();
}

class _SignUpUserState extends State<SignUpUser> {
  //bool _obscureText = true; 
  //String _username, _email, _password;
    
  //bool _isSubmitting; 
  
  //final _formKey = GlobalKey<FormState>();
  //final _scaffoldKey = GlobalKey<ScaffoldState>();
  //final DateTime timestamp = DateTime.now();

  FirebaseAuth auth = FirebaseAuth.instance;
   
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  TextEditingController nameInputController;
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmpwdInputController;

  @override
  void initState() {
    nameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmpwdInputController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login User"),
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _registerFormKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Full Name*', hintText: "User Name"),
                      controller: nameInputController,
                    keyboardType: TextInputType.emailAddress,
                    //validator: ,
                  ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email*', hintText: "User@gmail.com"),
                      controller: emailInputController,
                    keyboardType: TextInputType.emailAddress,
                    //validator: ,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password*', hintText: "********"),
                    controller: pwdInputController,
                    obscureText: true,
                    //validator: pwdValidator,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Confirm Password*', hintText: "********"),
                    controller: confirmpwdInputController,
                    obscureText: true,
                    //validator: pwdValidator,
                  ),
                  ElevatedButton(
                    child: Text("Sign Up"),
                    style: ElevatedButton.styleFrom(
                      onPrimary: Theme.of(context).accentColor,
                      primary: Theme.of(context).primaryColor
                    ),//style
                    onPressed: () {
                      if (_registerFormKey.currentState.validate()) {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailInputController.text,
                                password: pwdInputController.text)
                            .then((currentUser) => FirebaseFirestore.instance
                                .collection("users")
                                .doc(currentUser.toString())
                                .set({
                                  "uid": auth.currentUser.uid,
                                  "email": emailInputController.text,
                                  "username": nameInputController.text,
                                  "timestamp": DateTime.now()

                                })
                                .then((result)=>{Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage())
                                      , (_) => false)}));
                                //.catchError((err) => print(err)))
                            //.catchError((err) => print(err));
                      }
                    },//on pressed
                  ),
                  Text("Already have an account ?"),
                  TextButton(
                    child: Text("Sign In here!"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            )
          )
      )
    );
  }//build

  /*createUserInFirestore() async{
    context.  read<AuthenticationHelper>().addUserToDB(
      uid: auth.currentUser.uid,
      email: emailInputController.text,
      username: nameInputController.text,
      timestamp:DateTime.now()
    );
  }*/
}