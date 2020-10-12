import 'package:flutter/material.dart';
import 'package:tele_health/pay_consult_emergency/components/ConsultationScreenCard.dart';
import 'package:tele_health/pay_consult_emergency/components/ConfirmConsultation.dart';

class ConsultationScreen extends StatefulWidget {
  @override
  _ConsultationScreenState createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends State<ConsultationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white24,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.only(left: 15.0,right: 15.0,bottom: 15.0),
          // padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Image.asset('assets/icons8_home_page_50px_1.png'),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset('assets/icons8_consultation_50px_2.png'),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset('assets/icons8_mortar_and_pestle_50px.png'),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset('assets/icons8_settings_50px.png'),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 30.0, bottom: 15.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Consultation',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 30.0, top: 15.0, bottom: 15.0),
                child: Text(
                  'Choose Health Facility',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              ConsultationScreenCard(
                  onPress: () {
                    setState(() {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return ConfirmConsultation();
                          });
                    });
                  },
                  cardText: "KNUST Student Clinic"),
              ConsultationScreenCard(
                  onPress: () {
                    setState(() {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return ConfirmConsultation();
                          });
                    });
                  },
                  cardText: "KNUST Hospital"),
            ],
          )),
    );
  }
}
