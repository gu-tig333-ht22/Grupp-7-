import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyState extends ChangeNotifier {
  var _fact = 'skämtigt värre, hfueofbejfwbfuiwebu';
  get fact => _fact;

  Future doSomething() async {
    notifyListeners();
  }

  void doSomethingElse() async {
    notifyListeners();
  }

  Future fetchFact() async {
    http.Response response = await http
        .get(Uri.parse('https://uselessfacts.jsph.pl/random.json?language=en'));
    var result = response.body;
    var fact = jsonDecode(result);
    _fact = fact['text'];
    notifyListeners();
  }
}
