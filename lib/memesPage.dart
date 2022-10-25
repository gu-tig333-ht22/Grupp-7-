import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:template/data.dart';
import 'getapi.dart';

class MemesPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          //iconTheme: IconThemeData(color: Colors.grey),
          backgroundColor: Color.fromARGB(255, 212, 137, 203),
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
          elevation: 0,
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 212, 137, 203),
              Color.fromARGB(255, 233, 168, 170)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: (Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Consumer<MyState>(
                  builder: (context, state, child) =>
                      Provider.of<MyState>(context, listen: false).loading
                          ? Text(' ')
                          : Flexible(
                              flex: 9,
                              child: Image(
                                image: NetworkImage(state.meme),
                                height: MediaQuery.of(context).size.height,
                              ),
                            )),
              _viewNext(context),
            ]))));
  }

  Widget _viewNext(context) {
    return Container(
        margin: const EdgeInsets.all(5),
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            Provider.of<MyState>(context, listen: false).fetchMeme();
          },
          child: Text(
            'NÄSTA MEME',
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
