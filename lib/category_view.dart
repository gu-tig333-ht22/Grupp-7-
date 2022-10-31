import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:provider/provider.dart';
import 'package:template/Wordle/wordlestate.dart';

import 'category_handler.dart';
import 'Data/getapi.dart';
import 'joke_fact_view.dart';
import 'clock_view.dart';
import 'memes_view.dart';
import 'Wordle/wordle_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 212, 137, 203),
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
          elevation: 0,
        ),
        body: _categoryView(context));
  }

  Widget _categoryView(context) {
    return SafeArea(
      bottom: false,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 212, 137, 203),
          Color.fromARGB(255, 233, 168, 170)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _title(context),
            _categoryCard(context),
          ],
        ),
      ),
    );
  }

  Widget _title(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Dags att utforska\nkategorierna',
              style: TextStyle(
                  fontFamily: 'Jura',
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
              TyperAnimatedText('Ha det så skoj!',
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Jura',
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  speed: const Duration(milliseconds: 70)),
            ]),
          )
        ],
      ),
    );
  }

  Widget _categoryCard(context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.only(left: 28),
        height: 470,
        child: Swiper(
          pagination: const SwiperPagination(
              margin: EdgeInsets.only(top: 20),
              builder: DotSwiperPaginationBuilder(
                  activeColor: Colors.white, color: Colors.grey)),
          layout: SwiperLayout.STACK,
          itemCount: categories.length,
          itemWidth: MediaQuery.of(context).size.width - 2 * 64,
          itemBuilder: (
            context,
            index,
          ) {
            return InkWell(
              onTap: () {
                if (categories[index].name == 'MEMES') {
                  Provider.of<MyState>(context, listen: false).fetchMeme();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MemesView()));
                } else if (categories[index].name == 'KLOCKREN') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ClockView()));
                } else if (categories[index].name == 'WORDLE') {
                  Provider.of<WordleState>(context, listen: false)
                      .setRandomWord();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (const MyWordle())));
                } else if (categories[index].name == 'UTTRÅKAD?') {
                  Provider.of<MyState>(context, listen: false).fetchIdeasTodo();

                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, a, b) =>
                              JokeAndFactView(categories[index])));
                } else if (categories[index].name == 'CHUCK NORRIS JOKES') {
                  Provider.of<MyState>(context, listen: false)
                      .fetchChuckNorris();

                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, a, b) =>
                              JokeAndFactView(categories[index])));
                } else if (categories[index].name == 'PUNCHLINE JOKES') {
                  Provider.of<MyState>(context, listen: false)
                      .fetchPunchlineYokes();
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, a, b) =>
                              JokeAndFactView(categories[index])));
                }
              },
              child: Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 90,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        elevation: 8,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            height: 300,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Text(
                                      categories[index].name,
                                      style: const TextStyle(
                                          fontFamily: 'Jura',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 32),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: _exploreButton(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(categories[index].iconImage)),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _exploreButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('UTFORSKA KATEGORIN',
            style: TextStyle(
                letterSpacing: 2,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: 'Jura'),
            textAlign: TextAlign.left),
        Icon(Icons.arrow_forward),
      ],
    );
  }
}
