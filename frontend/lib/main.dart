import 'package:flutter/material.dart';
import 'package:frontend/screens/EntryScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Charity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EntryScreen(),
    );
  }
}
