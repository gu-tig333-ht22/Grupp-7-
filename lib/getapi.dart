import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyState extends ChangeNotifier {
  var _fact = 'skämtigt värre, hfueofbejfwbfuiwebu';
  get fact => _fact;
  var _mammayoke = 'lalla va kul';
  get mammayoke => _mammayoke;

  Future fetchFact() async {
    http.Response response = await http
        .get(Uri.parse('https://uselessfacts.jsph.pl/random.json?language=en'));
    var result = response.body;
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
}
