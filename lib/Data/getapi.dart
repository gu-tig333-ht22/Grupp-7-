import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyState extends ChangeNotifier {
  Future fetchFortuneCookie() async {
    _loading = true;
    notifyListeners();
    http.Response response = await http.get(Uri.parse(
      'https://digital-fortune-cookies-api.herokuapp.com/fortune',
    ));
    var result = response.body;
    var cookiedata = jsonDecode(result);
    var fortunecookie = cookiedata['cookie'];

    _cookie = fortunecookie['fortune'];
    _loading = false;
    notifyListeners();
  }

  String _cookie = '';
  String get cookie => _cookie;
  String _fact = '';
  String get fact => _fact;
  String _meme = 'https://i.redd.it/lkzgjs3botu91.jpg';
  String get meme => _meme;
  bool _loading = false;
  bool get loading => _loading;

  Future fetchIdeasTodo() async {
    _loading = true;
    notifyListeners();
    http.Response response =
        await http.get(Uri.parse('https://www.boredapi.com/api/activity'));
    var result = response.body;
    var fact = jsonDecode(result);
    _fact = fact['activity'];

    _loading = false;
    notifyListeners();
  }

  Future fetchPunchlineYokes() async {
    _loading = true;
    notifyListeners();
    http.Response response = await http
        .get(Uri.parse('https://official-joke-api.appspot.com/random_joke'));
    var result = response.body;
    var fact = jsonDecode(result);
    var setup = fact['setup'];
    var space = '  ';
    var punchline = fact['punchline'];
    _fact = setup + space + punchline;

    _loading = false;
    notifyListeners();
  }

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
}
