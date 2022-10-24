import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyState extends ChangeNotifier {
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
