import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homeviewtwo.dart';
import 'getapi.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(
        //systemOverlayStyle:
        //SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        //backgroundColor: Color.fromARGB(255, 0, 116, 71),
        //elevation: 0,
        //),
        body: flipcards(context));
  }

  Widget flipcards(context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            // alt. lägga in bakgrundsbild?
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 158, 117, 137),
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 158, 117, 137)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _title(context),
                _dailyjoke(context),
                _dailymeme(context),
                _next(context)
              ],
            ),
          ],
        ));
  }

  Widget _title(context) {
    return Padding(
      padding: const EdgeInsets.all(45),
      child: SizedBox(
        height: 150,
        child: AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
          TyperAnimatedText('Welcome\nTo\nPrankster!',
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                fontSize: 36.9,
                fontFamily: "PermanentMarker",
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 10, 29, 13),
              ),
              speed: Duration(milliseconds: 70))
        ]),
      ),
    );
  }

  Widget _dailyjoke(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: FlipCard(
          speed: 800,
          front: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            elevation: 25,
            color: Color.fromARGB(197, 255, 255,
                255), //verkar inte göra någon skillnad med färgval?
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2.5),
                  borderRadius: BorderRadius.circular(6),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 212, 137, 203),
                    Color.fromARGB(255, 233, 168, 170),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SizedBox(
                width: 300,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PRANKSTER',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        Text(
                          'Click to see today\'s joke',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 0, 0, 0), width: 1.5),
                        color: Color.fromARGB(255, 255, 255, 255),
                        shape: BoxShape.circle),
                  ),
                ),
              ),
            ),
          ),
          back: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            elevation: 25,
            //color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2.5),
                  borderRadius: BorderRadius.circular(6),
                  gradient: LinearGradient(
                      colors: [Colors.red, Colors.pink],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: SizedBox(
                child: Center(child: Text('Your daily joke')),
                width: 300,
                height: 200,
              ),
            ),
          )),
    );
  }

  Widget _dailymeme(context) {
    return FlipCard(
        speed: 800,
        front: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          elevation: 25,
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.5),
                borderRadius: BorderRadius.circular(6),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 212, 137, 203),
                  Color.fromARGB(255, 233, 168, 170),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: SizedBox(
              width: 300,
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PRANKSTER',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      Text(
                        'Click to see today\'s meme',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      shape: BoxShape.circle),
                ),
              ),
            ),
          ),
        ),
        back: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          elevation: 25,
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2.5),
              image: DecorationImage(
                  image: AssetImage("assets/no_meme.jpg"),
                  fit: BoxFit.fill), // ist för assets: MyState.fetchMeme()
              borderRadius: BorderRadius.circular(6),
            ),
            child: SizedBox(
              width: 300,
              height: 200,
            ),
          ),
        ));
  }

  Widget _next(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => HomeViewTwo()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CONTINUE THE FUN',
              style: TextStyle(
                  color: Color.fromARGB(255, 9, 44, 12), fontSize: 16),
            ),
            Icon(
              Icons.arrow_forward,
              color: Color.fromARGB(255, 9, 44, 12),
            )
          ],
        ),
      ),
    );
  }
}
