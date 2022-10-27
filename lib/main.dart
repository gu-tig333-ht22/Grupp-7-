import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Data/getapi.dart';
import 'home_view.dart';
import 'Wordle/wordlestate.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<MyState>(create: ((_) => MyState())),
      ChangeNotifierProvider<WordleState>(create: ((_) => WordleState())),
    ],
    child: MyApp(),
  ));
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
