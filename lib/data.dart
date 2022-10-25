// Klass för att skapa de olika kategorierna

class Categories {
  final String name;
  final String iconImage;

  Categories({
    required this.name,
    required this.iconImage,
  });
}

List<Categories> categories = [
  Categories(name: 'YO MOMMA JOKES', iconImage: 'assets/klockren.png'),
  Categories(name: 'RANDOM FACTS', iconImage: 'assets/klockren.png'),
  Categories(name: 'CHUCK NORRIS JOKES', iconImage: 'assets/klockren.png'),
  Categories(name: 'MEMES', iconImage: 'assets/klockren.png'),
  Categories(name: 'KLOCKREN', iconImage: 'assets/klockren.png'),
  Categories(name: 'WORDLE', iconImage: 'assets/klockren.png')
];
