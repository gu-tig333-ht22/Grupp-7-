import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Data/getapi.dart';
import 'home_view.dart';
import 'Wordle/wordlestate.dart';
import 'Data/data_pers.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<MyState>(create: ((_) => MyState())),
      ChangeNotifierProvider<WordleState>(create: ((_) => WordleState())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyState(),
      child: MaterialApp(
        home: HomeView(storage: MyAppStorage()),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
