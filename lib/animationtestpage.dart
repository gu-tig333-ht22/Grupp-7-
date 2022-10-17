import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'slide_animation_test.dart';
import 'rotate_animation_test.dart';

class AnimationTestPage extends StatefulWidget {
  @override
  _AnimatedTestPageState createState() => _AnimatedTestPageState();
}

class _AnimatedTestPageState extends State<AnimationTestPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon:
                  const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            )),
        body: ListView(children: [
          _slider(context),
          _rotater(context),
        ]),
      );
}

Widget _slider(context) {
  return Center(
    child: Container(
      width: 20,
      height: 200,
      child: TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => SlideBoxWidget()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Animated slider test',
                style: TextStyle(
                    color: Color.fromARGB(255, 9, 44, 12), fontSize: 16),
              ),
              Icon(
                Icons.arrow_forward,
                color: Color.fromARGB(255, 9, 44, 12),
              )
            ],
          )),
    ),
  );
}

Widget _rotater(context) {
  return Center(
    child: Container(
      width: 20,
      height: 200,
      child: TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => RotateBoxWidget()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Animated rotation test',
                style: TextStyle(
                    color: Color.fromARGB(255, 9, 44, 12), fontSize: 16),
              ),
              Icon(
                Icons.arrow_forward,
                color: Color.fromARGB(255, 9, 44, 12),
              )
            ],
          )),
    ),
  );
}
