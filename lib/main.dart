import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:template/HomePage.dart';
import 'package:template/categorypage.dart';
import 'data.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'getapi.dart';
import 'homeViewTwo.dart';
import 'dart:math';
import 'HomePage.dart';
import 'memesPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prankster',
      theme: ThemeData(),
      home: HomeView(),
    );
  }
}
