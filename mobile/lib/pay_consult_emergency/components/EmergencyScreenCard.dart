import 'package:flutter/material.dart';
import 'package:tele_health/pay_consult_emergency/components/constants.dart';

class EmergencyScreenCard extends StatelessWidget {
  EmergencyScreenCard(
      {@required this.cardText,
        this.onPressed,
        @required this.widget});

  final Function onPressed;
  final String cardText;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 18.0),
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: <Widget>[
                widget,
                Text(
                  cardText,
                  style: kCardTextStyle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
