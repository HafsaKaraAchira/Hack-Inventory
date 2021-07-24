import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HackathonGoerMain extends StatefulWidget {
  @override
  _HackathonGoerMain createState() => _HackathonGoerMain();
}

class _HackathonGoerMain extends State<HackathonGoerMain> {
  int hackCode;
  void getHackCode() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      hackCode = (prefs.getInt('hackCode'));
    });
  }

  @override
  Widget build(BuildContext context) {
    getHackCode();
    return Scaffold(
      appBar: AppBar(
        title: Text('Hackathon ${hackCode}'),
        // automaticallyImplyLeading: false,
      ),
      body: Center(
          //List Of equipment
          ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: const Text('Menu'),
          ),
          ListTile(
            title: const Text('Equipment Borrowed'),
            onTap: () {}
          ),
          ListTile(
            title: const Text('Borrow Equipment'),
            onTap: () {},
          ),
        ],
      )),
    );
  }
}
