import 'package:flutter/material.dart';
import 'package:tele_health/pay_consult_emergency/components/OKButton.dart';

class ConfirmConsultation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // actionsPadding: EdgeInsets.only(left: 20.0,right: 20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5.0,
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset('assets/icons8_cancel_50px.png')),
          ],
        ),
      ),

      actions: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15.0,bottom: 5.0),
              child: Text(
                'Proceed to send health records to the chosen health facility ?',
                style: TextStyle(
                  color: Color(0xFFF555555),
                  fontSize: 23.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: OKButton(
                onPressed: () {},
              ),
            )
          ],
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
