import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

//import 'package:hack_inventory/Models/UserModel.dart';
//import 'package:hack_inventory/Controllers/authentication.dart';
//import 'package:hack_inventory/View/SignUpUser.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key,this.uid}) : super(key: key);

  final String uid;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   FirebaseAuth auth = FirebaseAuth.instance;
  final userRef = FirebaseFirestore.instance.collection("users");
  //UserModel _currentUser;
  
  String _uid;
  String _username;
  String _email;

  var _counter = 0 ;
  
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  
  getCurrentUser() async {
    //UserModel currentUser = await context
      //  .read<AuthenticationHelper>()
        //.getUserFromDB(uid: this.widget.uid);
  
    //_currentUser = currentUser;
  
    //print("${_currentUser.username}");
    setState(() {
      _uid = auth.currentUser.uid;
      _username = auth.currentUser.displayName;
      _email = auth.currentUser.email;
    });
  }//getCurrentUser

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        centerTitle: true,
      ),
      body: auth.currentUser == null          
          ? Center(child: CircularProgressIndicator()):
           Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "uid is $_uid \n email is $_email\n name is $_username",
                  textAlign: TextAlign.center,
                ),
                Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'You have pushed the button this many times:',
                          ),
                          Text(
                            '$_counter',
                              style: Theme.of(context).textTheme.headline4,
                          ),
                          ElevatedButton(
                            child: Text("Sign Out"),
                            style: ElevatedButton.styleFrom(
                              onPrimary: Theme.of(context).accentColor,
                              primary: Theme.of(context).primaryColor
                            ),//style
                            onPressed: () {
                              //Provider.<FirebaseAuth>of(context,listen:true)
                              auth.signOut()
                              .then((_)=>{
                                Navigator.pushReplacementNamed(context,'/SignInUser')}
                              );
                            },
                          ),//ELEVATED
                        ],//COLUMN CHILDREN
                  ),
                ),
              ],
            ),
    );
  }

  void buildPrint(err) => print(err);//build
}



/*appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );*/