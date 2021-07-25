import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:hack_inventory/View/HomePage.dart';

class SignInUser extends StatefulWidget {
  SignInUser({key}) : super(key: key);

  @override
  _SignInUserState createState() => _SignInUserState();
}

class _SignInUserState extends State<SignInUser> {
  
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;

  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
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
                key: _loginFormKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email*', hintText: "username@gmail.com"),
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
                  ElevatedButton(
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(
                      onPrimary: Theme.of(context).accentColor,
                      primary: Theme.of(context).primaryColor
                    ),//style
                    onPressed: () {
                      if (_loginFormKey.currentState.validate()) {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: emailInputController.text,
                                password: pwdInputController.text)
                            .then((currentUser) => FirebaseFirestore.instance
                                .collection("users")
                                .doc(currentUser.toString())
                                .get()
                                .then((_)=>{}));
                                //.catchError((err) => print(err)))
                            //.catchError((err) => print(err));
                      }
                    },//on pressed
                  ),
                  Text("New User?"),
                  TextButton(
                    child: Text("Register here!"),
                    onPressed: () {
                      Navigator.pushNamed(context,'/SignUpUser');
                    },
                  )
                ],
              ),
            )
          )
      )
    );
  }
}