// Klass för att skapa de olika kategorierna
import 'package:flutter/cupertino.dart';

class Categories {
  final String name;
  final String iconImage;
  final String description;

  Categories({
    required this.name,
    required this.iconImage,
    required this.description,
  });
}

List<Categories> categories = [
  Categories(
      name: 'YO MOMMA JOKES',
      iconImage: 'assets/klockren.png', // förslag:
      description: 'A list with ya momma jokes'),
  Categories(
      name: 'RANDOM FACTS',
      iconImage: 'assets/klockren.png', // förslag:
      description: 'A list with random facts'),
  Categories(
      name: 'CHUCK NORRIS JOKES',
      iconImage: 'assets/klockren.png', // förslag:
      description: 'A list with Chuck Norris jokes'),
  Categories(
      name: 'MEMES',
      iconImage: 'assets/klockren.png', // förslag:
      description: 'A list with memes'),
  Categories(
      name: 'KLOCKREN',
      iconImage: 'assets/klockren.png', // ?? förslag:
      description: 'A list with memes'),
];

// note: gillade teddybjönren/pandan i manga/anime format
