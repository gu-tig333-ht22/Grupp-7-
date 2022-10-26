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
                backgroundColor: Color.fromARGB(255, 212, 137, 203),
                elevation: 0,
              ),
              body: flipcards(context),
            ));
  }

  Widget flipcards(context) {
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _title(context),
              _dailyRandomFact(context),
              //_gameButtons(),
              _buttonrow(),
              _next(context)
            ],
          )),
    );
  }

  Widget _title(context) {
    return AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
      TyperAnimatedText('Välkommen till\nPrankster!',
          textAlign: TextAlign.center,
          textStyle: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          speed: Duration(milliseconds: 70))
    ]);
  }

  Widget _dailyRandomFact(context) {
    var state = Provider.of<MyState>(context, listen: false);
    return Container(
      height: 200,
      width: 300,
      child: FlipCard(
        onFlip: () async {
          Provider.of<MyState>(context, listen: false).fetchFact();
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
            padding: const EdgeInsets.all(16),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'PRANKSTER',
                    style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'Nabla-Regular',
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Klicka för att se dagens\nrandom fakta',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'NotoSanaGeorgian'),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 255, 255, 255), width: 1.5),
                  color: Color.fromARGB(255, 255, 255, 255),
                  shape: BoxShape.circle),
            ),
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(2),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 195, 234, 217),
                Color.fromARGB(255, 255, 255, 255)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: SingleChildScrollView(
                  child: Text(
                    textAlign: TextAlign.center,
                    '${state.fact}',
                    style: TextStyle(
                        fontFamily: 'NotoSansGeorgian',
                        fontSize: 20,
                        color: Color.fromARGB(255, 48, 48, 48)),
                  ),
                ),
              ),
            ),
            width: 300,
            height: 200,
          ),
        ),
      ),
    );
  }

//  Widget _gameButtons() {
//    return Row(
//      children: [IconButton(onPressed: () {}, icon: Icon(Icons.rocket))],
//    );
//  }

  Widget _next(context) {
    return TextButton(
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
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'SulphurPoint-Bold'),
          ),
          Icon(
            Icons.arrow_forward,
            color: Color.fromARGB(255, 255, 255, 255),
          )
        ],
      ),
    );
  }

  Widget _buttonrow() {
    return Row(children: <Widget>[
      Expanded(
          child: TextButton(
              onPressed: () {},
              child: const Text(
                "STEN",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'SulphurPoint-Bold'),
              ))),
      Expanded(
          child: TextButton(
              onPressed: () {},
              child: const Text("SAX",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SulphurPoint-Bold')))),
      Expanded(
          child: TextButton(
              onPressed: () {},
              child: const Text(
                "PÅSE",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'SulphurPoint-Bold'),
              )))
    ]);
  }
}
