import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:template/data.dart';
import 'getapi.dart';

class CategoryPage extends StatelessWidget {
  final Categories categories;
  const CategoryPage(this.categories);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          var firstYoke = MyState();
          if (categories.name == 'RANDOM FACTS') {
            firstYoke.fetchFact();
          }
          if (categories.name == 'CHUCK NORRIS JOKES') {
            firstYoke.fetchChuckNorris();
          }
          if (categories.name == 'YO MOMMA JOKES') {
            firstYoke.fetchYoMamma();
          }

          //för alla apier som fungerar bör en sådan här läggas till.
          // detta gör att ett skämt/fact finns direkt på sidan

          return firstYoke;
        },
        builder: (context, child) => Scaffold(
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
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text(
                            categories.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (categories.name == 'RANDOM FACTS') {
                              Provider.of<MyState>(context, listen: false)
                                  .fetchFact();
                            }
                            if (categories.name == 'CHUCK NORRIS JOKES') {
                              Provider.of<MyState>(context, listen: false)
                                  .fetchChuckNorris();
                            }
                            if (categories.name == 'YO MOMMA JOKES') {
                              Provider.of<MyState>(context, listen: false)
                                  .fetchYoMamma();
                            }
                            if (categories.name == 'DEVELOPER JOKES') {
                              Provider.of<MyState>(context, listen: false)
                                  .fetchDevYoke();
                            }
                          },
                          child: Text(
                            'VIEW NEXT',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Container(
                            height: 430,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 212, 137, 203),
                                      Color.fromARGB(255, 233, 168, 170)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Center(
                                child: Consumer<MyState>(
                              builder: (context, state, child) => Padding(
                                padding: EdgeInsets.only(
                                    top: 25, left: 25, right: 25),
                                child: Text('${state.fact}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 35,
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                              ),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
