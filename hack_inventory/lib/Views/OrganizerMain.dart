import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrganizerMain extends StatefulWidget {
  @override
  _OrganizerMain createState() => _OrganizerMain();
}

class _OrganizerMain extends State<StatefulWidget> {
  int widgetListCounter = 0;
  List widgetList = [HackCodeInfo(), OrganizerAddEquip(), OrganizerViewEquip()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hackathon NAME'),
      ),
      body: Center(
        child: widgetList[widgetListCounter],
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
                title: const Text('Hack Code/ Info'),
                onTap: () {
                  setState(() {
                    widgetListCounter = 0;
                  });
                  Navigator.pop(context);
                }),
            ListTile(
              title: const Text('Add Equipment'),
              onTap: () {
                setState(() {
                  widgetListCounter = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('View Equipment'),
              onTap: () {
                setState(() {
                  widgetListCounter = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HackCodeInfo extends StatefulWidget {
  _HackCodeInfo createState() => _HackCodeInfo();
}

class _HackCodeInfo extends State<HackCodeInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Your Hackcode is NUMBERS'),
        // Add Hack Info
      ),
    );
  }
}

class OrganizerAddEquip extends StatefulWidget {
  _OrganizerAddEquip createState() => _OrganizerAddEquip();
}

class _OrganizerAddEquip extends State<OrganizerAddEquip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Add Equipment'),
        // TODO: Form
      ),
    );
  }
}

class OrganizerViewEquip extends StatefulWidget {
  _OrganizerViewEquip createState() => _OrganizerViewEquip();
}

class _OrganizerViewEquip extends State<OrganizerViewEquip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('View Equipment'),
        // TODO: List Builder
      ),
    );
  }
}
