
// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:template/ImageDialog.dart';

// class ImageDialog extends StatefulWidget {
//   @override
//   _ImageDialogState createState() => _ImageDialogState();
// }

// class _ImageDialogState extends State<ImageDialog> {
//   //final List<chuckNorrisgetter> list;
//   //const ImageDialogChuckJoke(this.list, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: getBody(),
//     );
//   }

//     Widget getBody() {
//     return ListView.builder(itemBuilder: (context, index) {
//       return Text('INDEX $index'); //vaule
//   }
//     );
// }
// }

// //*********************************RANDOMISERINGSTEST***************************

// // Än sålänge: när man klickar upp hundbild, så kommer vit bild upp
// // med random siffra var gång samt i terminalen random element från 1-19.
// // lägga till: onpressed/ontap: meme visible/not visible for 24 h/until 00.00,
// // loading eller liknande?
// // för att fästa daglig meme
// // lägg till lista ist för siffror
// // override för att få  ny bild eller "tas till ny framsidsupdate" med onpressed?

//   Widget _pickRandomMeme() {
//     final dailyMemeList = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];
//     final meme = (dailyMemeList..shuffle()).first;

//     Random rnd = new Random();
//     return Scaffold(body: Center(child: Text('$meme')));
//   }

//   Widget _pickRandomJoke(chuckNorrisgetter randomJokeAdress) {
//     final dailyJokeList = [
//       'a',
//       'b',
//       'c',
//       'd',
//       'e',
//       'f',
//       'g'
//     ];
//     final joke = (dailyJokeList..shuffle()).first;
//     print(joke);

//     Random rnd = new Random();
//     return Scaffold(body: Center(child: Text('$joke')));
//   }
// }

// class chuckNorrisgetter {
//   static List randomJokeAdress = ['https://api.chucknorris.io/jokes/random'];

//   static Future<String> getRandom() async {
//     http.Response response = await http.get(Uri.parse('$randomJokeAdress'));
//     var obj = jsonDecode(response.body);
//     return obj['value'];
//   }
// }



// class chuckNorrisgetter {
//   static String randomJokeAdress = 'https://api.chucknorris.io/jokes/random';

//   static Future<String> getRandom() async {
//     http.Response response = await http.get(Uri.parse('$randomJokeAdress'));
//     var obj = jsonDecode(response.body);
//     return obj['value'];
//   }
// }
//  class chuckNorrisgetter {
//   static String randomJokeAdress = 'https://api.chucknorris.io/jokes/random';

//   static Future<List<TodoClass>> getTodo() async {
//     var response = await http.get(Uri.parse('$randomJokeAdress'));
//     String bodyString = response.body;
//     var json = jsonDecode(bodyString);

//     return json.map<TodoClass>((data) {
//       return TodoClass.fromJson(data);
//     }).toList();
//   }
// }