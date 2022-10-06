import 'package:flutter/material.dart';
import 'package:template/homeviewtwo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeViewTwo(),
      debugShowCheckedModeBanner: false,
    );
  }
}
