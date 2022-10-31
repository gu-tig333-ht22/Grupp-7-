import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Data/getapi.dart';

class MemesView extends StatelessWidget {
  const MemesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'MEMES',
          style: TextStyle(
              fontSize: 24, fontFamily: 'Jura', fontWeight: FontWeight.w700),
        ),
        backgroundColor: const Color.fromARGB(255, 212, 137, 203),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 212, 137, 203),
          Color.fromARGB(255, 233, 168, 170)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: (Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Consumer<MyState>(
              builder: (context, state, child) =>
                  Provider.of<MyState>(context, listen: false).loading
                      ? const Text(' ')
                      : Flexible(
                          flex: 9,
                          child: Image(
                            image: NetworkImage(state.meme),
                            height: MediaQuery.of(context).size.height,
                          ),
                        ),
            ),
            _viewNext(context),
          ],
        )),
      ),
    );
  }

  Widget _viewNext(context) {
    return Container(
      margin: const EdgeInsets.all(12),
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Provider.of<MyState>(context, listen: false).fetchMeme();
        },
        child: const Text(
          'NÄSTA MEME',
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'Jura',
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
