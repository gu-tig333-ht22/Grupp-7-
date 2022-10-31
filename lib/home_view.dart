import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:template/Data/getapi.dart';

import 'category_view.dart';

class HomeView extends StatelessWidget {
  var storage;
  HomeView({this.storage});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyState>(
        builder: (BuildContext context, state, child) => Scaffold(
              appBar: AppBar(
                systemOverlayStyle:
                    SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
                backgroundColor: Color.fromARGB(255, 212, 137, 203),
                elevation: 0,
              ),
              body: flipCards(context),
            ));
  }

  Widget flipCards(context) {
    return SafeArea(
      bottom: false,
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 212, 137, 203),
            Color.fromARGB(255, 233, 168, 170)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _title(context),
              _dailyFact(context),
              _fortuneCookie(context),
              _next(context)
            ],
          )),
    );
  }

  Widget _title(context) {
    return AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
      TyperAnimatedText('Välkommen till\n LATTJO LAJBAN !',
          textAlign: TextAlign.center,
          textStyle: TextStyle(
            fontSize: 36,
            fontFamily: 'Jura',
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          speed: Duration(milliseconds: 70))
    ]);
  }

  Widget _dailyFact(context) {
    Future<Map<String, dynamic>> appData = storage.readJsonFile();
    var state = Provider.of<MyState>(context, listen: false);
    return Container(
      height: 200,
      width: 300,
      child: FlipCard(
        onFlip: () async {
          Provider.of<MyState>(context, listen: false).fetchDailyFact();
        },
        speed: 800,
        front: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(2),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 138, 222, 137),
                Color.fromARGB(255, 143, 212, 249),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'DAGENS FAKTA',
                    style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Nabla-Regular',
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'KLICKA HÄR!',
                    style: TextStyle(
                        letterSpacing: 2,
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Jura'),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 255, 255, 255), width: 1.5),
                  color: Color.fromARGB(255, 68, 8, 63),
                  shape: BoxShape.circle),
            ),
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Color.fromARGB(255, 255, 255, 255), width: 2),
              borderRadius: BorderRadius.circular(2),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 195, 234, 217),
                Color.fromARGB(255, 255, 255, 255)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Center(
              child: SingleChildScrollView(
                child: Text(
                  textAlign: TextAlign.center,
                  '${state.fact}',
                  style: TextStyle(
                      fontFamily: 'Jura',
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Color.fromARGB(255, 48, 48, 48)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _fortuneCookie(context) {
    return IconButton(
        icon: Image.asset('assets/fortune_cookie.png'),
        iconSize: 150,
        onPressed: () {
          Provider.of<MyState>(context, listen: false).fetchFortuneCookie();
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                elevation: 16,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 109, 109, 109))),
                  height: 80,
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 8, bottom: 8),
                    child: Center(
                      child: Consumer<MyState>(
                        builder: (context, state, child) =>
                            Provider.of<MyState>(context, listen: false).loading
                                ? Text('')
                                : SingleChildScrollView(
                                    child: Text(
                                      '${state.cookie}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'BadScript-Regular',
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                  ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  Widget _next(context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => CategoryView()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'UTFORSKA MER',
            style: TextStyle(
                letterSpacing: 2,
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 18,
                fontWeight: FontWeight.w900,
                fontFamily: 'Jura'),
          ),
          Icon(
            Icons.arrow_forward,
            color: Color.fromARGB(255, 255, 255, 255),
          )
        ],
      ),
    );
  }
}
