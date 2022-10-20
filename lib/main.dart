import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/getapi.dart';
import 'homeview.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prankster',
      theme: ThemeData(),
      home: const HomeView(),
    );
  }
}
