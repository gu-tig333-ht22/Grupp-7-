import 'dart:math';
import 'package:flutter/material.dart';
import 'ImageDialog.dart';
import 'homeViewTwo.dart';

// TODO:
// 1. randomnizea från lista/array av bilder
// som tagits från skämt och meme API
// 2. fästa daglig skämt/meme på framsidan efter upplåst

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome To Prankster"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _showJoke('Watch daily joke here'),
            _showMemes(),
            _continueFun(context),
          ],
        ),
      ),
    );
  }

  /* add in _showJoke: width: 1000,
          height: 600,
          fit: BoxFit.cover, */

  Widget _showJoke(titel) {
    return Container(
        width: 300,
        height: 200,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(
              22.0), // note: varför ändras inte kantera mer än bara lite grann?
        ),
        child: ElevatedButton(
          child: Text(titel),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => ImageDialog(
                    '')); // _showJoke(titel)); // ändra till lista av skämt
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 63, 29, 155)),
              textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        ));
  }

  Widget _showMemes() {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => ImageDialog(// lägg in dailyMemeList
                'https://media.istockphoto.com/videos/cloud-in-flat-style-with-shadow-flat-design-paper-cut-style-loop-with-video-id1208148233?s=640x640')); // note: molnet som poppar upp
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22.0),
          child: Image.network(
              'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2022-08/220805-border-collie-play-mn-1100-82d2f1.jpg',
              width: 300,
              height: 200,
              fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _continueFun(context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(90),
        child: ElevatedButton(
          child: Text('Continue The Fun'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeViewTwo(),
              ),
            );
          },
        ));
  }
}
