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
              title: const Text('Borrow Equipment'),
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
        child: Column(
          children: [
            const Text('Equipment Borrow'),
            Padding(
              padding: const EdgeInsets.all(8.0),
            ),
            ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Center(child: Text('Equipment ${index}')),
                    subtitle: ElevatedButton(
                      child: Text('Book Equip ${index}'),
                      onPressed: () {},
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class HGEquipReserve extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Equipment Reserved'),
            ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Center(child: Text('Equipment You Have ${index}')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
