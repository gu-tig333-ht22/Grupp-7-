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
          // convert to children för att kunna ha båda joke och meme list
          child: _pickRandomJoke(),
          //_pickRandomMeme(), // Image.network för bild
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
// lägga till: onpressed/ontap: meme visible/not visible for 24 h/until 00.00,
// loading eller liknande?
// för att fästa daglig meme
// lägg till lista ist för siffror
// override för att få  ny bild eller "tas till ny framsidsupdate" med onpressed?

  Widget _pickRandomMeme() {
    final dailyMemeList = [
      'a',
      'b',
      'c',
      'd',
      'e',
      'f',
      'g'
    ]; // add meme-API ist
    final meme = (dailyMemeList..shuffle()).first;

    Random rnd = new Random();
    return Scaffold(body: Center(child: Text('$meme')));
  }

  Widget _pickRandomJoke() {
    final dailyJokeList = [
      'a',
      'b',
      'c',
      'd',
      'e',
      'f',
      'g'
    ]; // add joke-API ist
    final joke = (dailyJokeList..shuffle()).first;
    print(joke);

    Random rnd = new Random();
    return Scaffold(body: Center(child: Text('$joke')));
  }

  /* void main() {
    var element = dailyMemeList[rnd.nextInt(dailyMemeList.length)];
    print(element); // generate a random index based on the dailyMemeList length and use it to retrieve the element
    element = randomListItem(dailyMemeList);
    print(element);
  }

  randomListItem(List dailyMemeList) =>
      dailyMemeList[rnd.nextInt(dailyMemeList.length)]; */
}
