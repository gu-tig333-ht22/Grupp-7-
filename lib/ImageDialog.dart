import 'package:flutter/material.dart';
import 'dart:math';

class ImageDialog extends StatelessWidget {
  final String link;
  const ImageDialog(this.link, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22.0),
        child: Dialog(
          child:
              _pickRandomMeme(), // Image.network( // eller _pickRandomMeme ist? som hämtar på API lista av memes?
          /* link,
          width: 1000,
          height: 600,
          fit: BoxFit.cover,*/
        ),
      ),
    );
    //);
  }

//*********************************RANDOMISERINGSTEST***************************

// Än sålänge: när man klickar upp hundbild, så kommer vit bild upp
// med random siffra var gång samt i terminalen random element från 1-19.

  Widget _pickRandomMeme() {
    final number = Random().nextInt(20);
    print(number);

    Random rnd = new Random();
    var dailyMemeList = ['a', 'b']; // add meme-API
    //var dailyJokeList = []; // add joke-API // generates a new Random object
    return Scaffold(body: Center(child: Text('$number')));
  }
}
    /* void main() {
      var element = dailyMemeList[rnd.nextInt(dailyMemeList.length)];
      print(
          element); // generate a random index based on the list length and use it to retrieve the element
      element = randomListItem(dailyMemeList);
      print(element);
    }

    randomListItem(List dailyMemeList) =>
    dailyMemeList[rnd.nextInt(dailyMemeList.length)]; */
