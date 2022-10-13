import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';

class SlideBoxWidget extends StatefulWidget {
  @override
  _SlideBoxWidgetState createState() => _SlideBoxWidgetState();
}

class _SlideBoxWidgetState extends State<SlideBoxWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();

    animation = Tween<double>(begin: -1, end: 0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon:
                  const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            )),
        body: Center(
          child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                final width = MediaQuery.of(context).size.width;
                final x = animation.value * width;

                return Transform(
                    transform: Matrix4.translationValues(x, 0, 0),
                    //child: child,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2.5),
                          borderRadius: BorderRadius.circular(6),
                          gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 212, 137, 203),
                                Color.fromARGB(255, 233, 168, 170),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                      child: SizedBox(
                        width: 300,
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'PRANKSTER',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                                Text(
                                  'Click to see today\'s joke',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    width: 1.5),
                                color: Color.fromARGB(255, 255, 255, 255),
                                shape: BoxShape.circle),
                          ),
                        ),
                      ),
                    ));
              }),
        ),
      );
}
