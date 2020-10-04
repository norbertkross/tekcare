import 'package:flutter/material.dart';
import 'package:tele_health/chat/people/ChatHomeScreen.dart';
import 'package:tele_health/chat/people/ChatRoomPeople.dart';
import 'package:tele_health/not_assigned/finishDrugs.dart';
import 'package:tele_health/not_assigned/listPharmacies.dart';
import 'package:tele_health/not_assigned/pharmacyShop.dart';
import 'package:tele_health/not_assigned/transactions.dart';

void main() {
  runApp(MyApp());
}
// #B00606
// RGB 176, 6, 6
class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  static Map<int, Color> color = {
  50: Color.fromRGBO(176, 6, 6, .1),
  100: Color.fromRGBO(176, 6, 6, .2),
  200: Color.fromRGBO(176, 6, 6, .3),
  300: Color.fromRGBO(176, 6, 6, .4),
  400: Color.fromRGBO(176, 6, 6, .5),
  500: Color.fromRGBO(176, 6, 6, .6),
  600: Color.fromRGBO(176, 6, 6, .7),
  700: Color.fromRGBO(176, 6, 6, .8),
  800: Color.fromRGBO(176, 6, 6, .9),
  900: Color.fromRGBO(176, 6, 6, 1),
  };

final MaterialColor customColor = MaterialColor(0xFFB00606, color);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TekCare',
      theme: ThemeData(
        primarySwatch: customColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: 
      Transactions()
      //ListPharmacies()
      //FinishDrugs()
      //PharmacyShop()
      //FeedBackPage()
      //ChatHome(),
      //GroupChat()
      ,
    );
  }
}
