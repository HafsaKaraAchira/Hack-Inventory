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
        child: Text('Request Below'),
      ),
    );
  }
}
