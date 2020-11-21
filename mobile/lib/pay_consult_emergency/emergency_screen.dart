import 'package:flutter/material.dart';
import 'package:tele_health/pay_consult_emergency/components/EmergencyScreenCard.dart';
import 'package:tele_health/pay_consult_emergency/components/RequestEmergency.dart';
import 'package:tele_health/pay_consult_emergency/components/constants.dart';

class EmergencyScreen extends StatefulWidget {
  @override
  _EmergencyScreenState createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_backspace,
              color: Colors.white,
              size: 35.0,
            ),
            onPressed: (){Navigator.pop(context);}),
        title: Text(
          'Emergency',
          style: kAppBarTextStyle,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            EmergencyScreenCard(
              onPressed: () {
                setState(() {
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return RequestEmergency(
                          startSpinner: true,
                          title: 'Please wait',
                          contentText: 'Requesting ambulance nearby ...',
                        );
                      });
                });
              },
              cardText: 'Request ambulance',
              widget:  Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('assets/icons8_siren_50px.png'),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.black.withOpacity(.1),
            ),
            EmergencyScreenCard(
              onPressed: () {
                setState(() {
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return RequestEmergency(
                          startSpinner: true,
                          title: 'Please wait',
                          contentText: 'Requesting SOS service ...',
                        );
                      });
                });

              },
              cardText: ' SOS',
              widget: IconButton(
                  icon: Icon(
                    Icons.phone,
                    color: Colors.black54,
                    size: 30.0,
                  ),
                  onPressed: () {}
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.black.withOpacity(.1),
            ),
          ],
        ),
      ),
    );
  }
}
