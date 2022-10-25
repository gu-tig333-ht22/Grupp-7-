import 'package:flutter/material.dart';
import 'homeview.dart';
import 'package:provider/provider.dart';
import 'Data/getapi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyState(),
      child: MaterialApp(
        home: HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
