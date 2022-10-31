import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'wordlestate.dart';

class MyWordle extends StatelessWidget {
  const MyWordle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 212, 137, 203),
          title: const Text('Wordle'),
        ),
        body: Consumer<WordleState>(
          builder: (context, state, child) => _wordleGame(context),
        ));
  }

  Widget _wordleGame(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _guessDisplay(context),
          _keyBoard(context),
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
            style: const TextStyle(fontSize: 30)));
  }

  Widget _keyBoard(context) {
    var keyBoard = CustomKeyboard(context).swedishKeyboard;

    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: SizedBox(
        height: 190,
        width: 450,
        child: Stack(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: GridView.count(
                childAspectRatio: 0.64,
                crossAxisCount: 11,
                children: keyBoard,
              )),
          Align(alignment: Alignment.bottomRight, child: _buttonRow(context))
        ]),
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

    return SizedBox(
      width: 153,
      height: 70.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 212, 137, 203),
                fixedSize: const Size(70, 60),
              ),
              onPressed: () {
                myGuess.removeLast();
                state.notifyListeners();
              },
              child: const Icon(Icons.backspace)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 212, 137, 203),
                  fixedSize: const Size(83, 60)),
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
              child: const Icon(Icons.check)),
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
