import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:template/HomePage.dart';
import 'package:template/categorypage.dart';
import 'data.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'homeViewTwo.dart';
import 'dart:math';
import 'getapi.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isBack = true;
  double angle = 0;

  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    }); // return meme
  }

  void _flip2() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(
            200, 255, 255, 255), //Color.fromARGB(255, 212, 137, 203),
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(200, 255, 255, 255),
            Color.fromARGB(255, 255, 255, 255),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: [
              Text('Welcome'),
              Text('To'),
              Text(
                'Prankster',
                style: TextStyle(
                    color: Color.fromARGB(255, 212, 137, 203),
                    fontSize: 35,
                    fontWeight: FontWeight.w700),
              ),
              _animatedText(),
              _card1(),
              _card2(),
              _continueFun(context)
            ],
          ),
        ),
      ),
    );
  }

  /* Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 25),
          child: Container(
            padding: EdgeInsets.all(20),
            height: 490,
            child: Stack(children: [
              Column(children: [ */

  Widget _animatedText() {
    return Center(
        child: AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
      TyperAnimatedText('Explore the world of fun',
          textStyle: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 233, 168, 170),
          ),
          speed: Duration(milliseconds: 70)),
    ]));
  }

  Widget _card1() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: _flip,
              child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: angle),
                  duration: Duration(seconds: 1),
                  builder: (BuildContext context, double val, __) {
                    //here we will change the isBack val so we can change the content of the card
                    if (val >= (pi / 2)) {
                      isBack = false;
                    } else {
                      isBack = true;
                    }
                    return (Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(
                            3, 2, 0.001) // Adds some perspective on the card
                        ..rotateY(val), //rotates the card
                      child: Container(
                        width: 300,
                        height: 200,
                        margin: EdgeInsets.all(10),
                        child: isBack
                            ? Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32)),
                                elevation: 35,
                                color: Colors.white,
                                child: Container(
                                  child: Text(
                                    'Click to get your daily joke',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  decoration: BoxDecoration(
                                    // deisgn a meme card to import as asset
                                    borderRadius: BorderRadius.circular(32),
                                    gradient: LinearGradient(colors: [
                                      Color.fromARGB(255, 212, 137, 203),
                                      Color.fromARGB(255, 233, 168, 170),
                                    ]),
                                  ),
                                ),
                              )
                            : Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()..rotateY(pi),
                                child: Container(
                                    decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  image: DecorationImage(
                                      image: AssetImage("assets/no_meme.jpg"),
                                      fit: BoxFit.cover),
                                )),
                              ),
                      ),
                    )
                        /* Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32)),
                                  elevation: 25,
                                  color: Colors.white,
                                ), */

                        );
                  })),
        ],
      ),
    );
    // ]
    // )
    /* Container(
                          width: 300,
                          height: 200,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 212, 137, 203),
                                Color.fromARGB(255, 233, 168, 170),
                              ])),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)),
                            elevation: 45,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ) */
    //      ,
    //      ))
    // ]));
  }

  Widget _card2() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: _flip2,
              child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: angle),
                  duration: Duration(seconds: 1),
                  builder: (BuildContext context, double val, __) {
                    //here we will change the isBack val so we can change the content of the card
                    if (val >= (pi / 2)) {
                      isBack = false;
                    } else {
                      isBack = true;
                    }
                    return (Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(
                              3, 2, 0.001) // Adds some perspective on the card
                          ..rotateY(val), //rotates the card
                        child: Container(
                          width: 300,
                          height: 200,
                          margin: EdgeInsets.all(10),
                          child: isBack
                              ? Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32)),
                                  elevation: 25,
                                  color: Colors.white,
                                  child: Container(
                                    child: Text(
                                      'Click to get your daily meme',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    decoration: BoxDecoration(
                                      // deisgn a meme card to import as asset
                                      borderRadius: BorderRadius.circular(32),
                                      gradient: LinearGradient(colors: [
                                        Color.fromARGB(255, 212, 137, 203),
                                        Color.fromARGB(255, 233, 168, 170),
                                      ]),
                                    ),
                                  ),
                                )
                              : Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.identity()..rotateY(pi),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(32),
                                        image: DecorationImage(
                                          image:
                                              AssetImage("assets/no_meme.jpg"),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                        )
                        /* Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32)),
                                  elevation: 25,
                                  color: Colors.white,
                                ), */

                        ));
                  })),
        ],
      ),
    );
    // ]
    // )
    /* Container(
                          width: 300,
                          height: 200,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 212, 137, 203),
                                Color.fromARGB(255, 233, 168, 170),
                              ])),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)),
                            elevation: 45,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ) */
    //      ,
    //      ))
    // ]));
  }

  Widget _continueFun(context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
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
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Colors.pink[200])))); ////255, 212, 137, 203
  }

  Widget _hej() {
    return Text('hej');
  }
}


//**********************Icon ovanför box******************************/

/* Container(alignment: Alignment.center,
                          height: 200,
                          child: Image.network(
                            categories[index].iconImage,
                            width: 150,
                            height: 150,
                          )*/