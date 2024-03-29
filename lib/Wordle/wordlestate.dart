import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/Data/word_data.dart';

class WordleState extends ChangeNotifier {
  List<Guess> _guesses = [
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

  Result todaysResult = Result();

  final ordLista = WordList();
  String hiddenWord = ''.toUpperCase();

  late Map<String, List<Color>> _displayColor = {
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

  void setRandomWord() async {
    hiddenWord = await WordList.randomWord;
    notifyListeners();
  }

  void incrementGuessNo() {
    if (guessNo < 5) {
      _guessNo++;

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

  void flashRed() {
    var key = guessNo.toString();
    var backToGrey = Future.delayed(const Duration(milliseconds: 20));
    _displayColor[key] = [
      Colors.red,
      Colors.red,
      Colors.red,
      Colors.red,
      Colors.red,
    ];
    notifyListeners();

    backToGrey.then((value) {
      _displayColor[key] = startColors();
      notifyListeners();
    });
  }

  Map charsIn(String word) {
    Map charMap = {};

    for (int i = 0; i < word.length; i++) {
      var char = word[i];
      charMap[char] == null ? charMap[char] = 1 : charMap[char]++;
    }
    return charMap;
  }

  void evaluateGuess(String word) async {
    var allWords = await ordLista.allWords;
    var charsInWord = charsIn(hiddenWord);
    var charsInGuess = charsIn(_guesses[guessNo].word);

    if (word.length < 5 == true ||
        allWords.contains(word.toLowerCase()) == false) {
      flashRed();
      return;
    }

    for (int i = 0; i < word.length; i++) {
      var char = _guesses[guessNo].word[i];

      Color changeColorTo = const Color.fromARGB(255, 103, 103, 103);

      if (charsInWord[char] == null) {
        charsInWord[char] = 0;
      }

      if (hiddenWord[i] == char) {
        buttonColorMap[char] = Colors.green;
        changeColorTo = Colors.green;
      } else if (hiddenWord.contains(char) && hiddenWord[i] != char) {
        charsInGuess[char]--;
        if (charsInWord[char] > charsInGuess[char]) {
          changeColorTo = Colors.purple;
        }
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
    notifyListeners();
  }

  void setResult() {
    if (_guesses[guessNo].word == hiddenWord.toUpperCase()) {
      todaysResult.won();
      notifyListeners();
    } else {
      if (guessNo > 4) {
        todaysResult.lost();
      }
    }
    notifyListeners();
  }

  Future<bool> validateGuess() async {
    var word = guesses[guessNo].word;
    var allWords = await ordLista.allWords;
    if (word.length < 5 == true ||
        allWords.contains(word.toLowerCase()) == false) {
      flashRed();
      return false;
    } else {
      return true;
    }
  }

  void gameReset() async {
    _guesses = [
      Guess(),
      Guess(),
      Guess(),
      Guess(),
      Guess(),
      Guess(),
    ];
    _guessNo = 0;
    _displayColor = {
      "0": startColors(),
      "1": startColors(),
      "2": startColors(),
      "3": startColors(),
      "4": startColors(),
      "5": startColors()
    };
    buttonColorMap = {};
    notifyListeners();
    hiddenWord = await WordList.getRandom();
    todaysResult = Result();
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

class Result {
  String _status = "in session";
  String get status => _status;

  void won() {
    _status = "vann";
  }

  void lost() {
    _status = "förlorade";
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

  List<Widget> keysList() {
    var state = Provider.of<WordleState>(
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
              state.notifyListeners();
              myGuess.addLetter(char);
            },
            child: Text(char, style: const TextStyle(fontSize: 18))));
      },
    );
    return keyList;
  }
}
