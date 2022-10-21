import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:math';

class WordList {
  static final randomWord = getRandom();
  late final allWords = readJson();

  static Future<List> readJson() async {
    final String response =
        await rootBundle.loadString('assets/five_letter_words_swe.json');
    final data = await json.decode(response);
    final dataList = data['data'];

    return dataList;
  }

  static Future<String> getRandom() async {
    final random = Random();
    var myList = await readJson();
    var i = random.nextInt(myList.length);
    String randomWord = myList[i];
    return randomWord.toUpperCase();
  }
}
