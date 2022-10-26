class Categories {
  final String name;
  final String iconImage;

  Categories({
    required this.name,
    required this.iconImage,
  });
}

List<Categories> categories = [
  Categories(name: 'YO MOMMA JOKES', iconImage: 'assets/yo_mama.png'),
  Categories(name: 'RANDOM FACTS', iconImage: 'assets/random_fact.png'),
  Categories(name: 'CHUCK NORRIS JOKES', iconImage: 'assets/chuck_norris.png'),
  Categories(name: 'MEMES', iconImage: 'assets/meme.png'),
  Categories(name: 'KLOCKREN', iconImage: 'assets/klockren.png'),
  Categories(name: 'WORDLE', iconImage: 'assets/Wordle.png')
];
