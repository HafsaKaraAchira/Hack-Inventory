import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart' ;

import 'package:hack_inventory/View/AuthView.dart';
import 'package:hack_inventory/Controllers/authentication.dart';
import 'package:hack_inventory/View/HomePage.dart';
import 'package:hack_inventory/View/SignUpOrganizer.dart';
import 'package:hack_inventory/View/SignUpUser.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}//main

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationHelper>(
          create: (_) => AuthenticationHelper(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) =>
              context.read<AuthenticationHelper>().authStateChanges),
      ],
      child:MaterialApp(
        theme:ThemeData(
          brightness: Brightness.dark ,
          primaryColor: Colors.lightBlueAccent,
          accentColor: Colors.yellow[400]
        ),
        home: AuthenticationWrapper(),
        routes: <String,WidgetBuilder>{
          '/HomePage':(BuildContext context) => HomePage(),
          '/SignUpOrganizer':(BuildContext context) => SignUpOrganizer(),
          '/SignUpUser':(BuildContext context) => SignUpUser(),
        }//routes
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      return HomePage();
    }else{
      return AuthView();
    }
  }//build
}//AuthenticationWrapper