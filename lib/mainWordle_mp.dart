import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/getapi.dart';
import './homeview.dart';
import 'statesWordle_mp.dart';
import 'daily_word.dart';

// MultiProvider(
//   providers: [
//     Provider<Something>(create: (_) => Something()),
//     Provider<SomethingElse>(create: (_) => SomethingElse()),
//     Provider<AnotherThing>(create: (_) => AnotherThing()),
//   ],
//   child: someWidget,
// )

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
    return MaterialApp(
      home: HomeView(),
    );
  }
}

class HomeView2 extends StatelessWidget {
  const HomeView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 221, 136, 229),
        appBar: AppBar(),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (WordleView())));
            },
            child: const Text('Till Wordle'),
          ),
        ));
  }
}

class WordleView extends StatelessWidget {
  WordleView({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    String dateToday = date.toString().substring(0, 10);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 41, 42, 66),
        appBar: AppBar(
          title: const Text('Wördlde'),
        ),
        body: Consumer<WordleState>(
          builder: (context, state, child) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(dateToday),
                guessDisplay(context),
                _keyBoard(context),
                _buttonRow(context),
              ],
            ),
          ),
        ));
  }

  Widget guessDisplay(context) {
    var state = Provider.of<WordleState>(
      context,
      listen: false,
    );
    return Column(children: [
      guessRow(context, 0),
      Container(
        height: 7,
      ),
      guessRow(context, 1),
      Container(
        height: 7,
      ),
      guessRow(context, 2),
      Container(
        height: 7,
      ),
      guessRow(context, 3),
      Container(
        height: 7,
      ),
      guessRow(context, 4),
      Container(
        height: 7,
      ),
      guessRow(context, 5),
      Container(
        height: 15,
      ),
    ]);
  }

  Widget guessRow(context, int guessIndex) {
    var state = Provider.of<WordleState>(
      context,
      listen: false,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _displayButton(context, guessIndex, 0),
        _displayButton(context, guessIndex, 1),
        _displayButton(context, guessIndex, 2),
        _displayButton(context, guessIndex, 3),
        _displayButton(context, guessIndex, 4),
      ],
    );
  }

  Widget _displayButton(context, guessIndex, charIndex) {
    var state = Provider.of<WordleState>(
      context,
      listen: false,
    );

    var myGuess = state.guesses[guessIndex];
    var displayColor = state.displayColor[guessIndex.toString()];

    return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(const Size(40, 60)),
          backgroundColor: MaterialStateProperty.all(displayColor?[charIndex]),
        ),
        child: Text(myGuess.letters[charIndex],
            style: const TextStyle(fontSize: 30) //, fontFamily: 'MetalLord'),
            ));
  }

  Widget _keyBoard(context) {
    var keyBoard = CustomKeyboard(context).swedishKeyboard;

    return Container(
      height: 190,
      width: 450,
      child: GridView.count(
        childAspectRatio: 0.65,
        crossAxisCount: 11,
        children: keyBoard,
      ),
    );
  }

  Widget _buttonRow(context) {
    var state = Provider.of<WordleState>(
      context,
      listen: false,
    );

    var index = state.guessNo;
    var myGuess = state.guesses[index];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              myGuess.removeLast();
              state.notify();
            },
            child: const Text('Backspace')),
        ElevatedButton(
            onPressed: () async {
              state.evaluateGuess(myGuess.word);
              state.setResult();
              bool isValid = await state.validateGuess();
              print(isValid);

              var result = state.todaysResult.status;
              if ((result == 'won' || result == 'lost') && (isValid == true)) {
                var replay = await _resultDialogue(context, state);
                print(replay);
                if (replay == 'Cancel') {
                  Navigator.pop(context);
                } else {
                  state.gameReset();
                }
              }
            },
            child: const Text('GUESS!')),
      ],
    );
  }

  Future _resultDialogue(context, state) {
    var result = state.todaysResult.status;
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('You $result'),
        content: result == 'won'
            ? const Text(
                'Good job! Bet you feel great about yourself!\n\n\n\nUp for another round?')
            : Text(
                'Too bad, we feel sorry for you. \nThe correct answer was: \n\n\n${state.dailyWord}'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Maybe later...'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('Of Course!'),
          ),
        ],
      ),
    );
  }
}