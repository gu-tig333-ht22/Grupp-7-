// Klass för att skapa de olika kategorierna
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
      name: 'DAD JOKES',
      iconImage: 'https://cdn-icons-png.flaticon.com/128/7251/7251743.png',
      description: 'A list with dad jokes'),
  Categories(2,
      name: 'RANDOM FACTS',
      iconImage: 'https://cdn-icons-png.flaticon.com/512/5619/5619947.png',
      description: 'A list with random facts'),
  Categories(3,
      name: 'EXCUSES',
      iconImage: 'https://cdn-icons-png.flaticon.com/512/686/686751.png',
      description: 'A list with excuses'),
  Categories(4,
      name: 'YO MOMMA JOKES',
      iconImage: 'https://cdn-icons-png.flaticon.com/512/686/686751.png',
      description: 'A list with yo momma jokes'),
  Categories(5,
      name: 'PICK UP LINES',
      iconImage: 'https://cdn-icons-png.flaticon.com/128/677/677684.png',
      description: 'A list with pick up lines'),
  Categories(6,
      name: 'CHUCK NORRIS JOKES',
      iconImage: 'https://cdn-icons-png.flaticon.com/512/4383/4383956.png',
      description: 'A list with Chuck Norris jokes'),
  Categories(7,
      name: 'GEEK JOKES',
      iconImage: 'https://cdn-icons-png.flaticon.com/512/6601/6601160.png',
      description: 'A list with geek jokes'),
  Categories(8,
      name: 'MEMES',
      iconImage: 'https://cdn-icons-png.flaticon.com/512/3475/3475926.png',
      description: 'A list with memes'),
];
