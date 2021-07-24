import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HackathonGoerCode extends StatefulWidget {
  @override
  _HackathonGoerCode createState() => _HackathonGoerCode();
}

class _HackathonGoerCode extends State<HackathonGoerCode> {
  final _formKey = GlobalKey<FormState>(); // Allows you identify the form
  final hackCodeController =
      TextEditingController(); // Allows you to retrive data from the form
  final hackTeamController = TextEditingController();
  void setHackInfo(int hackCode, int hackTeam) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('hackCode', hackCode);
    prefs.setInt('hackTeam', hackTeam);
    print(prefs.getInt('hackCode'));
    print(prefs.getInt('hackTeam'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Hackathon Code'),
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(children: <Widget>[
              TextFormField(
                controller: hackCodeController,
                decoration: const InputDecoration(
                  hintText: 'Enter Your Code',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Some Text';
                  } else if (double.tryParse(value) == null) {
                    return 'Please Input A Number';
                  }
                  // import firebase code and pass the email. Write if condition here to check with fire base
                  // Have to check if code exits
                  return null;
                },
              ),
              TextFormField(
                controller: hackTeamController,
                decoration: const InputDecoration(
                  hintText: 'Enter Your Team Number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Some Text';
                  } else if (double.tryParse(value) == null) {
                    return 'Please Input A Number';
                  }
                  // Have to check if code exits
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState.validate()) {
                      setHackInfo(int.parse(hackCodeController.text), int.parse(hackTeamController.text));
                      Navigator.pushReplacementNamed(context, '/hackGoer');
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
