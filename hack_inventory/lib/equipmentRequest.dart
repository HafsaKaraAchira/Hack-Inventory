import 'package:flutter/material.dart';

class EquipRequest extends StatefulWidget {
  @override
  _EquipRequest createState() => _EquipRequest();
}

class _EquipRequest extends State<EquipRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipment Request'),
      ),
      body: Center(
        // child: Text('Request Below'),
        child: Column(
          children: [
            Text('Request Below'),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter The Equipment You Want',
                      labelText: 'Equipment',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter Your Team Number',
                      labelText: 'Team Number',
                    ),
                  ),
                  new Container(
                    child: new ElevatedButton(
                      child: const Text('Submit'),
                      onPressed: null,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
