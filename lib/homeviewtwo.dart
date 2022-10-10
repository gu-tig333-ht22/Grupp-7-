import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeViewTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 212, 164, 137),
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        elevation: 0,
      ),
      body: categoryview(),
    );
  }

  Widget categoryview() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 212, 164, 137),
        Color.fromARGB(255, 233, 168, 170)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_excuses(), _randomfacts(), _dadjokes(), _geekjokes()],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _pickuplines(),
              _memes(),
              _yomommajokes(),
              _chucknorrisjokes()
            ],
          ),
        ],
      ),
    );
  }

  Widget _excuses() {
    return GestureDetector(
      onTap: () => {},
      child: Card(
        shadowColor: Color.fromARGB(255, 255, 250, 251),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Color.fromARGB(255, 225, 218, 218),
        elevation: 8,
        child: SizedBox(
          height: 140,
          width: 150,
          child: Center(
            child: Text(
              'EXCUSES',
              style: TextStyle(
                fontFamily: 'Times new roman',
                letterSpacing: 2,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _randomfacts() {
    return GestureDetector(
      onTap: () => {},
      child: Card(
        shadowColor: Color.fromARGB(255, 255, 250, 251),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Color.fromARGB(255, 225, 218, 218),
        elevation: 8,
        child: SizedBox(
          height: 140,
          width: 150,
          child: Center(
            child: Text(
              'RANDOM FACTS',
              style: TextStyle(
                fontFamily: 'Times new roman',
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _dadjokes() {
    return GestureDetector(
      onTap: () => {},
      child: Stack(
        children: [
          Card(
            shadowColor: Color.fromARGB(255, 255, 250, 251),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Color.fromARGB(255, 225, 218, 218),
            elevation: 8,
            child: SizedBox(
              height: 140,
              width: 150,
              child: Center(
                child: Text(
                  'DAD JOKES',
                  style: TextStyle(
                    fontFamily: 'Times new roman',
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/5578/5578868.png'),
          ),
        ],
      ),
    );
  }

  Widget _pickuplines() {
    return GestureDetector(
      onTap: () => {},
      child: Card(
        shadowColor: Color.fromARGB(255, 255, 250, 251),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Color.fromARGB(255, 225, 218, 218),
        elevation: 8,
        child: SizedBox(
          height: 140,
          width: 150,
          child: Center(
            child: Text(
              'PICK UP LINES',
              style: TextStyle(
                fontFamily: 'Times new roman',
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _memes() {
    return GestureDetector(
      onTap: () => {},
      child: Card(
        shadowColor: Color.fromARGB(255, 255, 250, 251),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Color.fromARGB(255, 225, 218, 218),
        elevation: 8,
        child: SizedBox(
          height: 140,
          width: 150,
          child: Center(
            child: Text(
              'MEMES',
              style: TextStyle(
                fontFamily: 'Times new roman',
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _yomommajokes() {
    return GestureDetector(
      onTap: () => {},
      child: Card(
        shadowColor: Color.fromARGB(255, 255, 250, 251),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Color.fromARGB(255, 225, 218, 218),
        elevation: 8,
        child: SizedBox(
          height: 140,
          width: 150,
          child: Center(
            child: Text(
              'YO MOMMA \n JOKES',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Times new roman',
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _geekjokes() {
    return GestureDetector(
      onTap: () => {},
      child: Card(
        shadowColor: Color.fromARGB(255, 255, 250, 251),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Color.fromARGB(255, 225, 218, 218),
        elevation: 8,
        child: SizedBox(
          height: 140,
          width: 150,
          child: Center(
            child: Text(
              'GEEK JOKES',
              style: TextStyle(
                fontFamily: 'Times new roman',
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _chucknorrisjokes() {
    return GestureDetector(
      onTap: () => {},
      child: Card(
        shadowColor: Color.fromARGB(255, 255, 250, 251),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Color.fromARGB(255, 225, 218, 218),
        elevation: 8,
        child: SizedBox(
          height: 140,
          width: 150,
          child: Center(
            child: Text(
              'CHUCK NORRIS \n JOKES',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Times new roman',
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}