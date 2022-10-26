import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'statesWordle_mp.dart';
import './daily_word.dart';

class MyState extends ChangeNotifier {
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

  var todaysResult = Result();

  final ordLista = WordList();
  String dailyWord = "coola".toUpperCase();

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
    dailyWord = await WordList.randomWord;
    notifyListeners();
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
    var charsInWord = charsIn(dailyWord);
    var charsInGuess = charsIn(_guesses[guessNo].word);

    if (word.length < 5 == true ||
        allWords.contains(word.toLowerCase()) == false) {
      flashRed();
      return;
    }

    for (int i = 0; i < word.length; i++) {
      var char = _guesses[guessNo].word[i];

      Color changeColorTo = Color.fromARGB(255, 103, 103, 103);

      if (charsInWord[char] == null) {
        charsInWord[char] = 0;
      }

      if (dailyWord[i] == char) {
        buttonColorMap[char] = Colors.green;
        changeColorTo = Colors.green;
      } else if (dailyWord.contains(char) && dailyWord[i] != char) {
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
    print('$charsInGuess\n$charsInWord');
  }

  void setResult() {
    if (_guesses[guessNo].word == dailyWord.toUpperCase()) {
      todaysResult.won();
      notifyListeners();
    } else {
      if (guessNo > 4) {
        todaysResult.lost();
      }
    }
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
    dailyWord = await WordList.getRandom();
    todaysResult = Result();
  }

  ////////////////////////////////////////////////////////
  String _fact = '';
  String get fact => _fact;
  String _meme = 'https://i.redd.it/lkzgjs3botu91.jpg';
  String get meme => _meme;
  bool _loading = false;
  bool get loading => _loading;

  Future fetchFact() async {
    _loading = true;
    notifyListeners();

    http.Response response = await http
        .get(Uri.parse('https://uselessfacts.jsph.pl/random.json?language=en'));
    var result = response.body;
    print(result);
    var fact = jsonDecode(result);
    _fact = fact['text'];

    _loading = false;

    notifyListeners();
  }

  Future fetchChuckNorris() async {
    _loading = true;
    notifyListeners();

    http.Response response =
        await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));
    var result = response.body;
    var fact = jsonDecode(result);
    _fact = fact['value'];

    _loading = false;

    notifyListeners();
  }

  Future fetchYoMamma() async {
    _loading = true;
    notifyListeners();

    http.Response response =
        await http.get(Uri.parse('https://yomomma-api.herokuapp.com/jokes'));
    var result = response.body;
    var fact = jsonDecode(result);
    _fact = fact['joke'];

    _loading = false;

    notifyListeners();
  }

  Future fetchMeme() async {
    _loading = true;
    notifyListeners();
    var uri = Uri.parse('https://meme-api.herokuapp.com/gimme');
    http.Response response = await http.get(uri);
    var result = response.body;
    var meme = jsonDecode(result);
    _meme = meme['url'];
    _loading = false;

    notifyListeners();
  }

  Future fetchDevYoke() async {
    _loading = true;
    notifyListeners();

    //funkar inte än
    http.Response response = await http
        .get(Uri.parse('https://backend-omega-seven.vercel.app/api/getjoke'));
    var result = response.body;
    print(result);
    var qandP = jsonDecode(result);
    var Q = qandP['question'];
    var P = qandP['punchline'];
    _fact = '$Q $P';

    _loading = false;

    notifyListeners();
  }
}
