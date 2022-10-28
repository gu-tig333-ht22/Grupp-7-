class Categories {
  final String name;
  final String iconImage;

  Categories({
    required this.name,
    required this.iconImage,
  });
}

List<Categories> categories = [
  Categories(name: 'PUNCHLINE JOKES', iconImage: 'assets/punch.png'),
  Categories(name: 'UTTRÅKAD?', iconImage: 'assets/yawn.png'),
  Categories(name: 'CHUCK NORRIS JOKES', iconImage: 'assets/chuck_norris.png'),
  Categories(name: 'MEMES', iconImage: 'assets/meme.png'),
  Categories(name: 'KLOCKREN', iconImage: 'assets/moose.png'),
  Categories(name: 'WORDLE', iconImage: 'assets/Wordle.png')
];
