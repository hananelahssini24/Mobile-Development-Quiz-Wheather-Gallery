import 'package:flutter/material.dart';

class Camera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
          child: Text(
        'Camera',
        style: TextStyle(fontSize: 22),
      )),
    );
  }
}
