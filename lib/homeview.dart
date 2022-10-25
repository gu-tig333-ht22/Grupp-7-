import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:template/getapi.dart';
import 'homeviewtwo.dart';

//https://docs.flutter.dev/cookbook/persistence

//safearea

//scrolla singlechildscrollview

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyState>(
      builder: (BuildContext context, state, child) => Scaffold(
          appBar: AppBar(
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
            backgroundColor: Color.fromARGB(255, 233, 213, 225),
            elevation: 0,
          ),
          body: flipcards(context)),
    );
  }

  Widget flipcards(context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 233, 213, 219),
          Color.fromARGB(255, 253, 253, 253)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround, //space around
          children: [
            _title(context),
            _dailyrandomfact(context),
            _dailymeme(context),
            _next(context)
          ],
        ));
  }

  Widget _title(context) {
    return SizedBox(
      child: AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
        TyperAnimatedText('Welcome\nTo\nPrankster!',
            textAlign: TextAlign.center,
            textStyle: TextStyle(
              fontSize: 36.9,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            speed: Duration(milliseconds: 70))
      ]),
    );
  }

  Widget _dailyrandomfact(context) {
    var state = Provider.of<MyState>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: FlipCard(
        onFlip: () async {
          Provider.of<MyState>(context, listen: false).fetchFact();
        },
        speed: 800,
        front: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.5),
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
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Click to see today\'s\nrandom fact',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
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
              border: Border.all(color: Colors.white, width: 1.5),
              borderRadius: BorderRadius.circular(2),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 68, 74, 65),
                Color.fromARGB(255, 138, 141, 133)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: Image(
                    image: AssetImage('assets/klockren.png'),
                    fit: BoxFit.cover),
              ),
            ),
            width: 300,
            height: 200,
          ),
        ),
      ),
    );
  }

  Widget _dailymeme(context) {
    return FlipCard(
        speed: 800,
        front: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.5),
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
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Click to see today\'s\nmeme',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
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
        back: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1.5),
            image: DecorationImage(
                image: AssetImage("assets/klockren.png"), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(2),
          ),
          child: SizedBox(
            width: 300,
            height: 200,
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
              style:
                  TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
