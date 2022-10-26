import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Data/datapers.dart';
import '../Data/getapi.dart';
import 'wordleview.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MyState(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(storage: MyAppStorage()),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.storage});

  final MyAppStorage storage;

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<MyState>(context, listen: false);
    state.setRandomWord();

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 221, 136, 229),
        appBar: AppBar(),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              DateTime now = DateTime.now();
              DateTime date = DateTime(now.year, now.month, now.day);
              String dateToday = date.toString().substring(0, 10);

              var saveData = MyAppStorage();
              saveData.writeState(dateToday, 'dailyWord', state.dailyWord);

              print(await saveData.readJsonFile());

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (WordleView())));
            },
            child: const Text('Till Wordle'),
          ),
        ));
  }
}
