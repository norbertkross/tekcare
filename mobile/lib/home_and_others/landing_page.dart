import "package:flutter/material.dart";


import 'package:tele_health/home_and_others/home_screen.dart';
import 'package:tele_health/home_and_others/settings_screen.dart';
import 'package:tele_health/not_assigned/listPharmacies.dart';
import 'package:tele_health/not_assigned/pharmacyShop.dart';
import 'package:tele_health/pay_consult_emergency/consultation_screen.dart';

class Landing extends StatefulWidget {
  Landing({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _bottomNavIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Home(),
    ConsultationScreen(),
    ListPharmacies(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomNavIndex,
          showSelectedLabels: false,
          elevation: 2.0,
          showUnselectedLabels: false,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/consultation.png",
                width: 30,
                height: 30,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/mortar_and_pestle.png",
                width: 30,
                height: 30,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 30,
              ),
              label: "",
            ),
          ]),
    );
  }

  _onItemTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }
}
