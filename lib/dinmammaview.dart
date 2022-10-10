import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';

class DinMammaView extends StatelessWidget {
  const DinMammaView({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyState(),
        builder: (context, child) => Scaffold(
              backgroundColor: const Color.fromARGB(248, 248, 248, 238),
              appBar: AppBar(),
              body: Center(
                child: Column(
                  children: [
                    _cloud(),
                    Container(height: 50),
                    _likeornot(),
                    Container(height: 70),
                    //_nextjoke(), VERKAR INTE FUNGERA ATT HA DENNA KNAPP UTANFÖR BUILDERN, DEN FATTAR INTE VAD CONTECT ÄR I PROVIDERN DÅ... DÄRFÖR STÅR DEN NEDANFÖR ISTÄLLET
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.lightBlue,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.all(25),
                        ),
                        onPressed: () {
                          Provider.of<MyState>(context, listen: false)
                              .fetchFact();
                        },
                        child: const Text('Next joke, please!',
                            style: TextStyle(fontSize: 20)))
                  ],
                ),
              ),
            ));
  }

  Widget _cloud() {
    return Stack(children: [
      Image.network(
        'https://www.pngitem.com/pimgs/m/533-5336200_transparent-background-cloud-clipart-png-download-animated-transparent.png',
        fit: BoxFit.cover,
      ),
      Positioned.fill(
          child: Align(
              alignment: Alignment.center,
              child: Consumer<MyState>(
                builder: (context, state, child) => Text(
                  '${state.fact}',
                  style: const TextStyle(fontSize: 18, color: Colors.cyan),
                ),
              )))
    ]);
  }

  Widget _likeornot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _thumbsup(),
        _thumbsdown(),
      ],
    );
  }

  Widget _thumbsup() {
    return TextButton.icon(
      onPressed: () {
        print('ThumbsUp!');
      },
      icon: const Icon(
        Icons.thumb_up_alt_outlined,
        size: 80.0,
        color: Colors.green,
      ),
      label: const Text(''),
    );
  }

  Widget _thumbsdown() {
    return TextButton.icon(
      onPressed: () {
        print('ThumbsDown!');
      },
      icon: const Icon(
        Icons.thumb_down_alt_outlined,
        size: 80.0,
        color: Colors.red,
      ),
      label: const Text(''),
    );
  }

  /*Widget _nextjoke() {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.lightBlue,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.all(25),
        ),
        onPressed: () {
          Provider.of<MyState>(context, listen: false).fetchFact();
          },
        child:
            const Text('Next joke, please!', style: TextStyle(fontSize: 20)));
  }*/
}
