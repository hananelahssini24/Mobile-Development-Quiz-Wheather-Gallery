import 'package:flutter/material.dart';
import './main-drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: const Text('My App'),
        backgroundColor: Colors.deepOrange,
      ),
      body: const Center(
        child: Text(
          'Hello IIBDCC',
          style: TextStyle(fontSize: 22, color: Colors.deepOrange),
        ),
      ),
    );
  }
}
