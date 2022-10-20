// Hemvy 2 - Välja mellan olika kategorier
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:template/categorypage.dart';
import 'package:template/getapi.dart';
import 'data.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'klockren.dart';
import 'memesPage.dart';
import 'package:provider/provider.dart';

class HomeViewTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 212, 137, 203),
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
          elevation: 0,
        ),
        body: categoryview(context));
  }

  Widget categoryview(context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 212, 137, 203),
        Color.fromARGB(255, 233, 168, 170)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Let\'s continue the fun',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700),
                  ),
                  AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
                    TyperAnimatedText('Choose a category to explore',
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        speed: Duration(milliseconds: 70)),
                  ])
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 70),
            child: Container(
              padding: EdgeInsets.only(left: 28),
              height: 470,
              child: Swiper(
                pagination: SwiperPagination(
                    margin: EdgeInsets.only(top: 20),
                    builder: DotSwiperPaginationBuilder(
                        activeColor: Colors.white, color: Colors.grey)),
                layout: SwiperLayout.STACK,
                itemCount: categories.length,
                itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (categories[index].name == 'MEMES') {
                        Provider.of<MyState>(context, listen: false)
                            .fetchMeme();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => memesPage()));
                      } else if (categories[index].name == 'KLOCKREN') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Clock()));
                      } else {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, a, b) =>
                                    CategoryPage(categories[index])));
                      }
                    },
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 90,
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color:
                                          Color.fromARGB(255, 208, 207, 207)),
                                  borderRadius: BorderRadius.circular(32)),
                              elevation: 6,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: SizedBox(
                                  height: 300,
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 50),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 30),
                                          child: Text(
                                            categories[index].name,
                                            style: TextStyle(
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 28),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Explore this category',
                                                style: TextStyle(fontSize: 15),
                                                textAlign: TextAlign.left,
                                              ),
                                              Icon(Icons.arrow_forward)
                                            ],
                                          ),
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
          )
        ],
      ),
    );
  }
}
