//import 'dart:html';
import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prankster',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        //canvasColor: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}
