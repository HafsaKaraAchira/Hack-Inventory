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

  int widgetListCounter = 0;
  List widgetList = [HGEquipBorrow(), HGEquipReserve()];

  @override
  Widget build(BuildContext context) {
    getHackCode();
    return Scaffold(
      appBar: AppBar(
        title: Text('Hackathon ${hackCode}'),
        // automaticallyImplyLeading: false,
      ),
      body: Center(
          // List of stuff here
          child: widgetList[widgetListCounter]),
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
              onTap: () {
                setState(() {
                  widgetListCounter = 0;
                });
                Navigator.pop(context);
              }),
          ListTile(
            title: const Text('Reserved Equipment'),
            onTap: () {
              setState(() {
                  widgetListCounter = 1;
                });
              Navigator.pop(context);
            },
          ),
        ],
      )),
    );
  }
}

class HGEquipBorrow extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text('Equipment Borrow'),
      ),
    );
  }
}

class HGEquipReserve extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text('Equipment Reserve'),
      ),
    );
  }
}