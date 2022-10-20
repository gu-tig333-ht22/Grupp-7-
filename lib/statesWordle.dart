import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyState extends ChangeNotifier {
  final List<Guess> _guesses = [
    Guess(),
    Guess(),
    Guess(),
    Guess(),
    Guess(),
    Guess(),
  ];

  List<Guess> get guesses => _guesses;
  int _guessNo = 0;
  int get guessNo => _guessNo;

  String dailyWord = "tjena".toUpperCase();

  late final Map<String, List<Color>> _displayColor = {
    "0": startColors(),
    "1": startColors(),
    "2": startColors(),
    "3": startColors(),
    "4": startColors(),
    "5": startColors()
  };

  Map<String, List<Color>> get displayColor => _displayColor;

  Map<String, Color> buttonColorMap = {};

  List<Color> startColors() {
    return [Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey];
  }

  void incrementGuessNo() {
    if (guessNo < 5) {
      _guessNo++;

      notifyListeners();
    }
  }

  void decrementGuessNo() {
    //denna ska tas bort, endast för testning
    if (guessNo > 0) {
      _guessNo--;
      notifyListeners();
    }
  }

  void changeDisplayColor(Color background, int guessIndex, int charIndex) {
    _displayColor[guessIndex.toString()]?[charIndex > 0 ? charIndex : 0] =
        background;
  }

  void addToColorMap(key) {
    buttonColorMap[key] = Colors.grey;
  }

  void evaluateGuess(String word) {
    if (word.length < 5 == true) {
      return;
    }
    for (int i = 0; i < word.length; i++) {
      var char = _guesses[guessNo].word[i];
      Color changeColorTo;

      if (dailyWord[i] == char) {
        buttonColorMap[char] = Colors.green;
        changeColorTo = Colors.green;
      } else if (dailyWord.contains(char) && dailyWord[i] != char) {
        changeColorTo = Colors.purple;

        if (buttonColorMap[char] != Colors.green) {
          buttonColorMap[char] = Colors.purple;
        }
      } else {
        changeColorTo = const Color.fromARGB(255, 103, 103, 103);
        buttonColorMap[char] = changeColorTo;
      }
      changeDisplayColor(changeColorTo, guessNo, i);
      notifyListeners();
    }
    incrementGuessNo();
  }

  void switchToRed(String key) {
    //Denna här ska också tas bort, endast för testning
    // buttonColorMap[key] == Colors.red
    //     ? buttonColorMap[key] = Colors.grey
    //     : buttonColorMap[key] = Colors.red;
    notifyListeners();
  }
}

class Guess {
  final List<String> _letters = ['', '', '', '', ''];
  List<String> get letters => _letters;
  String _word = '';
  String get word => _word;

  Guess();

  void _wordFromLetters() {
    var wrd = '';
    _letters.forEach((letter) {
      if (letter != '') {
        wrd = wrd + letter;
      }
    });
    _word = wrd;
  }

  void addLetter(String char) {
    var index = _word.length;
    index < 5 ? _letters[index] = char : _letters[index - 1] = char;
    _wordFromLetters();
  }

  void removeLast() {
    var index = _word.isNotEmpty ? _word.length - 1 : 0;
    _letters[index] = '';
    _wordFromLetters();
  }
}

class CustomKeyboard {
  BuildContext context;
  late var swedishKeyboard = keysList();
  final List swedishAlpha = [
    'Q',
    'W',
    'E',
    'R',
    'T',
    'Y',
    'U',
    'I',
    'O',
    'P',
    'Å',
    'A',
    'S',
    'D',
    'F',
    'G',
    'H',
    'J',
    'K',
    'L',
    'Ö',
    'Ä',
    'Z',
    'X',
    'C',
    'V',
    'B',
    'N',
    'M'
  ];

  CustomKeyboard(this.context);

  Map<String, Widget> keyboard() {
    var state = Provider.of<MyState>(
      context,
      listen: false,
    );
    var index = state.guessNo;
    var myGuess = state.guesses[index];

    Map<String, Widget> keyMap =
        {}; // JAG TROR INTE DENNA KOMMER BEHÖVAS, MEN DEN LIGGER KVAR TILLS JAG VET
    swedishAlpha.forEach(
      (char) {
        if (state.buttonColorMap.containsKey(char) == false) {
          state.addToColorMap(char);
        }
        keyMap[char] = ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(state.buttonColorMap[char])),
            onPressed: () {
              state.switchToRed(char);
              myGuess.addLetter(char);
            },
            child: Text(char));
      },
    );
    return keyMap;
  }

  List<Widget> keysList() {
    var state = Provider.of<MyState>(
      context,
      listen: false,
    );
    var index = state.guessNo;
    var myGuess = state.guesses[index];

    List<Widget> keyList = [];
    swedishAlpha.forEach(
      (char) {
        if (state.buttonColorMap.containsKey(char) == false) {
          state.addToColorMap(char);
        }
        keyList.add(ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(state.buttonColorMap[char])),
            onPressed: () {
              state.switchToRed(char);
              myGuess.addLetter(char);
            },
            child: Text(char, style: const TextStyle(fontSize: 18))));
      },
    );
    return keyList;
  }
}
