import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hack_inventory/Models/UserModel.dart';
import 'package:hack_inventory/Controllers/authentication.dart';
//import 'package:hack_inventory/View/SignUpUser.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   FirebaseAuth auth = FirebaseAuth.instance;
  final userRef = FirebaseFirestore.instance.collection("users");
  UserModel _currentUser;
  
  String _uid;
  String _username;
  String _email;
  
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  
  getCurrentUser() async {
    UserModel currentUser = await context
        .read<AuthenticationHelper>()
        .getUserFromDB(uid: auth.currentUser.uid);
  
    _currentUser = currentUser;
  
    print("${_currentUser.username}");
    setState(() {
      _uid = _currentUser.uid;
      _username = _currentUser.username;
      _email = _currentUser.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        centerTitle: true,
      ),
      body: _currentUser == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "uid is $_uid , email is $_email, name is $_username",
                  textAlign: TextAlign.center,
                ),
                Center(
                  child: ElevatedButton(
                    child: Text("Sign Out"),
                    style: ElevatedButton.styleFrom(
                      onPrimary: Theme.of(context).accentColor,
                      primary: Theme.of(context).primaryColor
                    ),//style
                    onPressed: () {
                      context.read<AuthenticationHelper>().signOut();
                    },
                  ),
                ),
              ],
            ),
    );
  }//build
}