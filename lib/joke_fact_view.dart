import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:template/assets_handler.dart';
import 'Data/getapi.dart';

class JokeAndFactView extends StatelessWidget {
  final Categories categories;
  const JokeAndFactView(this.categories, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _titel(),
                _jokeAndFactCard(),
                _viewNextButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _titel() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Text(
        categories.name,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Jura',
          fontWeight: FontWeight.w900,
          fontSize: 40,
        ),
      ),
    );
  }

  Widget _jokeAndFactCard() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        height: 430,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 212, 137, 203),
              Color.fromARGB(255, 233, 168, 170)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
            child: Consumer<MyState>(
          builder: (context, state, child) =>
              Provider.of<MyState>(context, listen: false).loading
                  ? Text('')
                  : Padding(
                      padding: EdgeInsets.only(top: 25, left: 25, right: 25),
                      child: SingleChildScrollView(
                        child: Text('${state.fact}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Jura',
                                fontWeight: FontWeight.w900,
                                fontSize: 35,
                                color: Color.fromARGB(255, 255, 255, 255))),
                      ),
                    ),
        )),
      ),
    );
  }

  Widget _viewNextButton(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 212, 137, 203)),
          onPressed: () {
            if (categories.name == 'RANDOM FACTS') {
              Provider.of<MyState>(context, listen: false).fetchFact();
            }
            if (categories.name == 'CHUCK NORRIS JOKES') {
              Provider.of<MyState>(context, listen: false).fetchChuckNorris();
            }
            if (categories.name == 'YO MOMMA JOKES') {
              Provider.of<MyState>(context, listen: false).fetchYoMamma();
            }
          },
          child: Text(
            'SE NÄSTA',
            style: TextStyle(
                letterSpacing: 2,
                color: Colors.white,
                fontFamily: 'Jura',
                fontWeight: FontWeight.w900),
          )),
    );
  }
}
