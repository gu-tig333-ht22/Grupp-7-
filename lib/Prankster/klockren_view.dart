import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'package:flutter/services.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  ClockViewState createState() => ClockViewState();
}

class ClockViewState extends State<ClockView> {
  double minutesAngle = 0;
  double secondsAngle = 0;
  double hoursAngle = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      final now = DateTime.now();
      setState(() {
        secondsAngle = (pi / 30) * now.second;
        minutesAngle = pi / 30 * now.minute;
        hoursAngle = (pi / 6 * now.hour) + (pi / 45 * minutesAngle);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 177, 82, 218),
        alignment: const Alignment(0, 0),
        child: Scaffold(
            appBar: AppBar(
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
                child: Center(
                  child: Container(
                    //ClockView
                    width: 370,
                    height: 370,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(115, 230, 182, 226), width: 8),
                      borderRadius: BorderRadius.circular(200),
                    ),
                    //ClockView
                    child: Stack(
                      children: <Widget>[
                        Image(
                            image: AssetImage('assets/siffror_klocka.png'),
                            fit: BoxFit.cover),
                        Positioned(
                          top: 30,
                          child: SizedBox(
                            height: 237,
                            child: Image(
                                image: AssetImage('assets/klockren.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        //Seconds
                        Transform.rotate(
                          angle: secondsAngle,
                          child: Container(
                            alignment: const Alignment(0, -0.35),
                            child: Container(
                              height: 140,
                              width: 2,
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),

                        //Minutes
                        Transform.rotate(
                          angle: minutesAngle,
                          child: Container(
                            alignment: const Alignment(0, -0.35),
                            child: Container(
                              height: 95,
                              width: 5,
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        //Hours
                        Transform.rotate(
                          angle: hoursAngle,
                          child: Container(
                            alignment: const Alignment(0, -0.2),
                            child: Container(
                              height: 70,
                              width: 7,
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        //Dot
                        Container(
                          alignment: const Alignment(0, 0),
                          child: Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
