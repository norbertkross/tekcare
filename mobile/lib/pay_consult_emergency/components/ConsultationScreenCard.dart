import 'package:flutter/material.dart';


class ConsultationScreenCard extends StatelessWidget {

  ConsultationScreenCard({@required this.cardText,@required this.onPress});

  final String cardText;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding:
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: Material(
          borderRadius: BorderRadius.circular(12.0),
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: <Widget>[
                Image.asset('assets/knust-logo.png',
                    height: 100,
                    width: 100),
                Flexible(
                  child: Text(
                    cardText,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22.0,
                      letterSpacing: 0.5,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
