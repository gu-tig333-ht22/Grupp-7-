import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Data/datapers.dart';
import 'statesWordle.dart';
import 'dailyword.dart';
import '../Data/getapi.dart';
//import '/homeview.dart';

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
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WordleView(storage: MyAppStorage()),
    );
  }
}

class WordleView extends StatelessWidget {
  const WordleView({super.key, required this.storage});

  final MyAppStorage storage;

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<WordleState>(context, listen: false);
    state.setRandomWord();

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 221, 136, 229),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 212, 137, 203),
          elevation: 0,
        ),
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
                  MaterialPageRoute(builder: (context) => (MyWordle())));
            },
            child: const Text('Till Wordle'),
          ),
        ));
  }
}

class MyWordle extends StatelessWidget {
  MyWordle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 212, 137, 203),
          title: const Text('Wordle'),
        ),
        body: Consumer<WordleState>(
          builder: (context, state, child) => wordleGame(context),
        ));
  }

  Widget wordleGame(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _guessDisplay(context), //ändrat till prviat - fel eller rätt?
          _keyBoard(context),
          _buttonRow(context),
        ],
      ),
    );
  }

  Widget _guessDisplay(context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: guessRow(context, 0),
      ),
      Container(
        height: 7,
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: guessRow(context, 1),
      ),
      Container(
        height: 7,
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: guessRow(context, 2),
      ),
      Container(
        height: 7,
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: guessRow(context, 3),
      ),
      Container(
        height: 7,
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: guessRow(context, 4),
      ),
      Container(
        height: 7,
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: guessRow(context, 5),
      ),
      Container(
        height: 15,
      ),
    ]);
  }

  Widget guessRow(context, int guessIndex) {
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
            onPressed: () async {
              var dailyWord = WordList.getRandom();
              print(await dailyWord);
            },
            child: const Text('ORDLISTA\n[Debug only]')),
        ElevatedButton(

            ///Denna knapp ska tas bort sen, endast för testning
            onPressed: () {
              state.decrementGuessNo();
              myGuess = state.guesses[index];

              state.notifyListeners();
            },
            child: const Text('Previous\n[Debug only]')),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 212, 137, 203),
            ),
            onPressed: () {
              myGuess.removeLast();
              state.notifyListeners();
            },
            child: const Text('Ångra')),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 212, 137, 203),
            ),
            onPressed: () async {
              state.evaluateGuess(myGuess.word);
              state.setResult();
              bool isValid = await state.validateGuess();
              print(isValid);

              var result = state.todaysResult.status;
              if ((result == 'vann' || result == 'förlorade') &&
                  (isValid == true)) {
                var replay = await _resultDialogue(context, state);
                print(replay);
                if (replay == 'Avbryt') {
                  Navigator.pop(context);
                } else {
                  state.gameReset();
                }
              }
            },
            child: const Text('GISSA!')),
      ],
    );
  }

  Future _resultDialogue(context, state) {
    var result = state.todaysResult.status;
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Se där, du $result!'),
        content: result == 'vann'
            ? Text(
                "Bra jobbat! Hoppas du känner dig stolt över dig själv!\n\nSå, '${state.dailyWord}'... \nVem hade kunnat ana det?\n\nRedo för en ny runda?")
            : Text(
                "Synd.. Men du kämpade på in i det sista. \n\n\nDet rätta svaret var: \n\n'${state.dailyWord}'\n\nRedo för en ny runda?\n\n"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Avbryt'),
            child: const Text('Kanske senare...'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('Såklart!'),
          ),
        ],
      ),
    );
  }
}
