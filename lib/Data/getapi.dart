import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:template/Data/data_pers.dart';

class MyState extends ChangeNotifier {
  MyAppStorage appStorage = MyAppStorage();
  Future fetchFortuneCookie() async {
    _loading = true;
    notifyListeners();
    http.Response response = await http.get(Uri.parse(
      'https://digital-fortune-cookies-api.herokuapp.com/fortune',
    ));
    var result = response.body;
    print(result);

    var lyckadkaka = jsonDecode(result);
    print(lyckadkaka);
    var visakakan = lyckadkaka['cookie'];
    print(visakakan);
    _fact = visakakan['fortune'];
    print(_fact);
    _loading = false;
    notifyListeners();
  }

  String _fact = '';
  String get fact => _fact;
  String _meme = 'https://i.redd.it/lkzgjs3botu91.jpg';
  String get meme => _meme;
  bool _loading = false;
  bool get loading => _loading;

  fetchFact() async {
    _loading = true;
    notifyListeners();

    http.Response response = await http
        .get(Uri.parse('https://uselessfacts.jsph.pl/random.json?language=en'));
    var result = response.body;

    _fact = jsonDecode(result)['text'];

    _loading = false;
    notifyListeners();
  }

  fetchDailyFact() async {
    var appData = await appStorage.readJsonFile();
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    String dateToday = date.toString().substring(0, 10);

    _loading = true;
    notifyListeners();

    http.Response response = await http
        .get(Uri.parse('https://uselessfacts.jsph.pl/random.json?language=en'));
    var result = response.body;

    if (await appData.containsKey(dateToday)) {
      _fact = await appData[dateToday]['fact'];
    } else {
      _fact = jsonDecode(result)['text'];
      appStorage.writeState(dateToday, 'fact', _fact);

      _loading = false;
    }

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

//  TA BORT?? Future fetchDevYoke() async {
//     _loading = true;
//     notifyListeners();

//     //funkar inte än
//     http.Response response = await http
//         .get(Uri.parse('https://backend-omega-seven.vercel.app/api/getjoke'));
//     var result = response.body;
//     print(result);
//     var qandP = jsonDecode(result);
//     var Q = qandP['question'];
//     var P = qandP['punchline'];
//     _fact = '$Q $P';

//     _loading = false;

//     notifyListeners();
//   }
//
}
