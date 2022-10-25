import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:template/getapi.dart';
import 'homeviewtwo.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyState>(
        builder: (BuildContext context, state, child) => Scaffold(
              appBar: AppBar(
                systemOverlayStyle:
                    SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
                backgroundColor: Color.fromARGB(255, 158, 117, 137),
                elevation: 0,
              ),
              body: flipcards(context),
            ));
  }

  Widget flipcards(context) {
    return SafeArea(
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              // alt. lägga in bakgrundsbild?
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 158, 117, 137),
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 158, 117, 137)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround, //space around
            children: [
              Flexible(
                // fungerar i teorin, men behöver justeras pga inte snyggt
                flex: 1,
                child: _title(context),
              ),
              Flexible(
                flex: 1,
                child: _dailyRandomFact(context),
              ),
              /*Flexible(
                flex: 1,
                child: _dailyMeme(context),
              ),*/
              Flexible(flex: 1, child: _next(context)),
            ],
          )),
    );
  }

  Widget _title(context) {
    return AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
      TyperAnimatedText(
          'Välkommen till\nPrankster!', // ska anpassas efter flexible
          textAlign: TextAlign.center,
          textStyle: TextStyle(
            fontSize: 40,
            fontFamily: "GloriaHallelujah",
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          speed: Duration(milliseconds: 70))
    ]);
  }

  Widget _dailyRandomFact(context) {
    var state = Provider.of<MyState>(context, listen: false);
    return FlipCard(
      onFlip: () async {
        Provider.of<MyState>(context, listen: false).fetchFact();
      },
      speed: 800,
      front: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(2),
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
                    'PRANKSTER', // ska anpassas efter flexible
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'PermanentMarker',
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Tryck för att se dagens\nrandom fact', // ska anpassas efter flexible
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
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
      back: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(2),
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 68, 74, 65),
              Color.fromARGB(255, 138, 141, 133)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Center(
              child: SingleChildScrollView(
                // funkar inte
                child: Text(
                  textAlign: TextAlign.center, 'sten',
                  //'${state.fact}',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          width: 300,
          height: 200,
        ),
      ),
    );
  }

  Widget _dailyMeme(context) {
    var state = Provider.of<MyState>(context, listen: false);
    return FlipCard(
      onFlip: () async {
        Provider.of<MyState>(context, listen: false).fetchMeme();
      },
      speed: 800,
      front: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(2),
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
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'PermanentMarker'),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Tryck för att se dagens\nmeme',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2),
                  color: Color.fromARGB(255, 255, 255, 255),
                  shape: BoxShape.circle),
            ),
          ),
        ),
      ),
      back: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(2),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 68, 74, 65),
                Color.fromARGB(255, 138, 141, 133)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          width: 300,
          height: 200,
          child: Center(
            child: Image(
                image: NetworkImage(state.meme),
                fit: BoxFit.fill // fungerar inte?
                ),
          )),
    );
  }

  Widget _next(context) {
    return OutlinedButton(
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
            'KLICKA HÄR FÖR ATT UTFORSKA MER',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Icon(
            Icons.arrow_forward,
            color: Color.fromARGB(255, 9, 44, 12),
          )
        ],
      ),
    );
  }
}
