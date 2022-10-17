// Klass för att skapa de olika kategorierna
import 'package:flutter/cupertino.dart';

class Categories {
  final int position;
  final String name;
  final String iconImage;
  final String description;

  Categories(
    this.position, {
    required this.name,
    required this.iconImage,
    required this.description,
  });
}

List<Categories> categories = [
  Categories(1,
      name: 'YO MOMMA JOKES',
      iconImage: 'https://cdn-icons-png.flaticon.com/128/7251/7251743.png',
      description: 'A list with ya momma jokes'),
  Categories(2,
      name: 'RANDOM FACTS',
      iconImage: 'https://cdn-icons-png.flaticon.com/512/5619/5619947.png',
      description: 'A list with random facts'),
  Categories(3,
      name: 'EXCUSES',
      iconImage: 'https://cdn-icons-png.flaticon.com/512/686/686751.png',
      description: 'A list with excuses'),
  Categories(4,
      name: 'DAD JOKES',
      iconImage: 'https://cdn-icons-png.flaticon.com/512/686/686751.png',
      description: 'A list with dad jokes'),
  Categories(5,
      name: 'PICK UP LINES',
      iconImage: 'https://cdn-icons-png.flaticon.com/128/677/677684.png',
      description: 'A list with pick up lines'),
  Categories(6,
      name: 'CHUCK NORRIS JOKES',
      iconImage: 'https://cdn-icons-png.flaticon.com/512/4383/4383956.png',
      description: 'A list with Chuck Norris jokes'),
  Categories(7,
      name: 'DEVELOPER JOKES',
      iconImage: 'https://cdn-icons-png.flaticon.com/512/6601/6601160.png',
      description: 'A list with geek jokes'),
  Categories(8,
      name: 'MEMES',
      iconImage: 'https://cdn-icons-png.flaticon.com/512/3475/3475926.png',
      description: 'A list with memes'),
];

class Fact {
  String afact;

  Fact({required this.afact});

  static Fact fromJson(afact) {
    return Fact(afact: afact['text']);
  }
}

class Meme {
  String URL;

  Meme({required this.URL});
}
