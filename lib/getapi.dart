import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyState extends ChangeNotifier {
  String _fact = '';
  String get fact => _fact;
  String _meme = 'https://i.redd.it/lkzgjs3botu91.jpg';
  String get meme => _meme;

  Future fetchFact() async {
    http.Response response = await http
        .get(Uri.parse('https://uselessfacts.jsph.pl/random.json?language=en'));
    var result = response.body;
    print(result);
    var fact = jsonDecode(result);
    _fact = fact['text'];
    notifyListeners();
  }

  Future fetchChuckNorris() async {
    http.Response response =
        await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));
    var result = response.body;
    var fact = jsonDecode(result);
    _fact = fact['value'];
    notifyListeners();
  }

  Future fetchYoMamma() async {
    //funkar inte när jag använder
    http.Response response =
        await http.get(Uri.parse('https://yomomma-api.herokuapp.com/jokes'));
    var result = response.body;
    var fact = jsonDecode(result);
    _fact = fact['joke'];
    notifyListeners();
  }

  Future fetchMeme() async {
    print("abcd");
    var uri = Uri.parse('https://meme-api.herokuapp.com/gimme');
    print("2zzzz");
    http.Response response = await http.get(uri);
    print("efgh");
    var result = response.body;
    var meme = jsonDecode(result);
    _meme = meme['url'];
    notifyListeners();
  }

  Future fetchDevYoke() async {
    //funkar inte än
    http.Response response = await http
        .get(Uri.parse('https://backend-omega-seven.vercel.app/api/getjoke'));
    var result = response.body;
    print(result);
    var qandP = jsonDecode(result);
    var Q = qandP['question'];
    var P = qandP['punchline'];
    _fact = '$Q $P';
    notifyListeners();
  }
}
