import 'package:flutter/material.dart';
import 'package:tele_health/Walkthrough/introScreens.dart';

import 'home_and_others/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static Map<int, Color> color = {
    50: Color(0xff980407).withOpacity(.1),
    100: Color(0xff980407).withOpacity(.2),
    200: Color(0xff980407).withOpacity(.3),
    300: Color(0xff980407).withOpacity(.4),
    400: Color(0xff980407).withOpacity(.5),
    500: Color(0xff980407).withOpacity(.6),
    600: Color(0xff980407).withOpacity(.7),
    700: Color(0xff980407).withOpacity(.8),
    800: Color(0xff980407).withOpacity(.9),
    900: Color(0xff980407).withOpacity(1),
  };

  final MaterialColor customColor = MaterialColor(0xFFB00606, color);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TekCare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SF-Pro',
        primarySwatch: customColor,
        primaryColor: Color(0xff980407),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IntroScreen(),
    );
  }
}
