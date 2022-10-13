import 'dart:html';
import 'dart:math' as math; // used in "Animation two"
import 'dart:math';
import 'package:flutter/material.dart';

class RotateBoxWidget extends StatefulWidget {
  @override
  _RotationBoxWidgetState createState() => _RotationBoxWidgetState();
}

class _RotationBoxWidgetState extends State<RotateBoxWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 15),
      vsync: this,
    )..repeat();

    animation = Tween<double>(begin: 0, end: 2 * pi).animate(controller);
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
            builder: (context, child) => Transform.rotate(
              angle: animation.value,
              child: child,
            ),
            animation: animation,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2.5),
                  borderRadius: BorderRadius.circular(6),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 212, 137, 203),
                    Color.fromARGB(255, 233, 168, 170),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
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
                              fontSize: 10, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 0, 0, 0), width: 1.5),
                        color: Color.fromARGB(255, 255, 255, 255),
                        shape: BoxShape.circle),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}


//**************************AnimationTest*****************/

// class AnimationTest extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<AnimationTest>
//     with SingleTickerProviderStateMixin {
//   //final Image starsBackground = Image.asset(
//   //'assets/kidding.png',
//   //);
//   //final Image ufo = Image.asset('assets/no_meme.jpg');
//   late AnimationController _animation;

//   @override
//   void initState() {
//     super.initState();
//     _animation = AnimationController(
//       duration: const Duration(seconds: 5),
//       vsync: this,
//     )..repeat();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: AlignmentDirectional.center,
//       children: <Widget>[
//         //starsBackground,
//         AnimatedBuilder(
//           animation: _animation,
//           builder: (_, __) {
//             return ClipPath(
//               clipper: const BeamClipper(),
//               child: Container(
//                 height: 1000,
//                 decoration: BoxDecoration(
//                   gradient: RadialGradient(
//                     radius: 1.5,
//                     colors: [
//                       Colors.yellow,
//                       Colors.transparent,
//                     ],
//                     stops: [0, _animation.value],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//         //ufo,
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     _animation.dispose();
//     super.dispose();
//   }
// }

// class BeamClipper extends CustomClipper<Path> {
//   const BeamClipper();

//   @override
//   getClip(Size size) {
//     return Path()
//       ..lineTo(size.width / 2, size.height / 2)
//       ..lineTo(size.width, size.height)
//       ..lineTo(0, size.height)
//       ..lineTo(size.width / 2, size.height / 2)
//       ..close();
//   }

//   /// Return false always because we always clip the same area.
//   @override
//   bool shouldReclip(CustomClipper oldClipper) => false;
// }