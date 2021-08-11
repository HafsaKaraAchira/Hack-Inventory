import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:hack_inventory/View/SignInOrganizer.dart';
import 'package:hack_inventory/View/SignInUser.dart';

class AuthView extends StatefulWidget {
  AuthView({key}) : super(key: key);

  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  PageController pageController= PageController(
    initialPage: 0 ,
    keepPage: true ,
  ) ;
  int pageIndex = 0;

  @override
  void initState() { 
    super.initState();
    pageController = PageController();
  }

  @override 
  void dispose(){
    super.dispose();
    pageController.dispose();
  }

  onTapChanged(int pageIndex){
    setState(() {
      this.pageIndex = pageIndex ;
    });  
  }

  onTap(int pageIndex){
    pageController.animateToPage(pageIndex
    , duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          SignInUser(),
          SignInOrganizer()
        ],
      controller: pageController,
      onPageChanged: onTapChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            label: "Sign In User",
            icon: Icon(
              FontAwesomeIcons.signInAlt,
            )
          ),
          BottomNavigationBarItem(
            label: "Sign In Organizer",
            icon: Icon(
              FontAwesomeIcons.userPlus,
            )
          )
        ],//items
      )
    );
  }
}