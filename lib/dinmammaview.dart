import 'package:flutter/material.dart';

class DinMammaView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(248, 248, 248, 238),
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            _cloud3(),
            Container(height: 50),
            _likeornot(),
            Container(height: 70),
            _nextjoke(),
          ],
        ),
      ),
    );
  }

  Widget _cloud3() {
    return Stack(children: [
      Image.network(
        'https://www.pngitem.com/pimgs/m/533-5336200_transparent-background-cloud-clipart-png-download-animated-transparent.png',
        fit: BoxFit.cover,
      ),
      const Positioned.fill(
          child: Align(
        alignment: Alignment.center,
        child: Text(
          'Skääämt',
          style: TextStyle(
              fontSize: 18, fontFamily: 'Merriweather', color: Colors.cyan),
        ),
      ))
    ]);
  }

  /*Widget _cloud2() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
      width: 600,
      height: 300,
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: GridTile(
          child: Image.network(
            'https://media.istockphoto.com/videos/cloud-in-flat-style-with-shadow-flat-design-paper-cut-style-loop-with-video-id1208148233?s=640x640',
            fit: BoxFit.cover,
          ),
          footer: Container(
            padding: EdgeInsets.all(8),
            color: Colors.blue.withOpacity(.5),
            child: Text(
              'Skämt hahahhahaha',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }*/

  Widget _cloud() {
    return Container(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          //child: Image.network('https://googleflutter.com/sample_image.jpg'),
          child: Image.network(
              'https://media.istockphoto.com/videos/cloud-in-flat-style-with-shadow-flat-design-paper-cut-style-loop-with-video-id1208148233?s=640x640'),
        ) // Foreground widget here
        );
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
        style:
        TextButton.styleFrom(backgroundColor: Colors.black);
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

  Widget _nextjoke() {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.lightBlue,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.all(25),
        ),
        onPressed: () {
          print('Pressed');
        },
        child: const Text('Next joke, please!',
            style: TextStyle(fontSize: 20, fontFamily: 'Merriweather')));
  }
}
