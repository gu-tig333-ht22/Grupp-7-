import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Data/datapers.dart';
import 'states_wordle.dart';
import 'word_data.dart';
import '../Data/getapi.dart';

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
          //_buttonRow(context),
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
      child: Stack(children: [
        Align(
            alignment: Alignment.centerLeft,
            child: GridView.count(
              childAspectRatio: 0.65,
              crossAxisCount: 11,
              children: keyBoard,
            )),
        Align(alignment: Alignment.bottomRight, child: _buttonRow(context))
      ]),
    );
  }

  Widget _buttonRow(context) {
    var state = Provider.of<WordleState>(
      context,
      listen: false,
    );

    var index = state.guessNo;
    var myGuess = state.guesses[index];

    return Container(
      width: 164,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 212, 137, 203),
                fixedSize: Size(81, 64),
              ),
              onPressed: () {
                myGuess.removeLast();
                state.notifyListeners();
              },
              child: const Icon(Icons.backspace)), //const Text('Ångra')),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 212, 137, 203),
                  fixedSize: Size(81, 64)),
              onPressed: () async {
                bool isValid = await state.validateGuess();

                if (state.todaysResult.status == 'in session') {
                  state.evaluateGuess(myGuess.word);
                  if (isValid) {
                    state.setResult();
                  }
                } else {
                  state.gameReset();
                  return;
                }

                var result = state.todaysResult.status;

                if ((result == 'vann' || result == 'förlorade') &&
                    (isValid == true)) {
                  var replay = await _resultDialogue(context, state);

                  if (replay == 'Avbryt') {
                    Navigator.pop(context);
                  } else {
                    state.gameReset();
                  }
                }
              },
              child: const Icon(Icons.spellcheck)),
        ],
      ),
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
                "Bra jobbat! Hoppas du känner dig stolt över dig själv!\n\n\nSå, '${state.hiddenWord}'... \n\n\nVem hade kunnat ana det?\n\n\nRedo för en ny runda?\n")
            : Text(
                "Synd.. Men du kämpade på in i det sista. \n\n\nDet rätta svaret var: \n\n'${state.hiddenWord}'\n\n\nRedo för en ny runda?\n"),
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

// void main() {
//   Provider.debugCheckInvalidValueType = null;

//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider<MyState>(create: ((_) => MyState())),
//       ChangeNotifierProvider<WordleState>(create: ((_) => WordleState())),
//     ],
//     child: MyApp(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: WordleView(storage: MyAppStorage()),
//     );
//   }
// }

// class WordleView extends StatelessWidget {
//   const WordleView({super.key, required this.storage});

//   final MyAppStorage storage;

//   @override
//   Widget build(BuildContext context) {
//     var state = Provider.of<WordleState>(context, listen: false);
//     state.setRandomWord();

//     return Scaffold(
//         backgroundColor: Color.fromARGB(255, 221, 136, 229),
//         appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 212, 137, 203),
//           elevation: 0,
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () async {
//               DateTime now = DateTime.now();
//               DateTime date = DateTime(now.year, now.month, now.day);
//               String dateToday = date.toString().substring(0, 10);

//               var saveData = MyAppStorage();
//               saveData.writeState(dateToday, 'hiddenWord', state.hiddenWord);

//               print(await saveData.readJsonFile());

//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => (MyWordle())));
//             },
//             child: const Text('Till Wordle'),
//           ),
//         ));
//   }
// }
