import 'package:flutter/material.dart';
<<<<<<< HEAD

/*class klockren extends StatelessWidget {
//  AddItemView();

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyState(),
        builder: (context, child) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.grey),
                backgroundColor: Colors.white,
                systemOverlayStyle:
                    SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
                elevation: 0,
              ),
              body: Center(
                child: Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Provider.of<MyState>(context, listen: false)
                            .fetchMeme();
                      },
                      icon: Icon(Icons.save, size: 24.0),
                      label: Text('SAVE'), // <-- Text
                    ),
                    Consumer<MyState>(
                        builder: (context, state, child) => Image(
                              image: NetworkImage(state.meme),
                            )),
                  ],
                ),
              ),
            ));
  }
}
*/

//HEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEJ

=======
>>>>>>> dd2281f9e98bd0d70ab9f8eec3aa62088c267b84
import 'dart:async';
import 'dart:math';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  ClockState createState() => ClockState();
}

class ClockState extends State<Clock> {
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
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 177, 82, 218),
        alignment: const Alignment(0, 0),
        child: Scaffold(
            appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.grey),
                backgroundColor: Colors.white),
            body: Center(
              child: Container(
                //Clock
                width: 370,
                height: 370,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45, width: 8),
                  borderRadius: BorderRadius.circular(200),
                ),
                //Clock
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      'http://content.mycutegraphics.com/graphics/household/clock-face-without-hands.png',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        top: 30,
                        child: SizedBox(
                            height: 237,
                            child: Image.network(
                              'https://365psd.com/images/previews/1c9/cartoon-moose-51988.png',
                              fit: BoxFit.cover,
                            ))),
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
            )));
  }
}
