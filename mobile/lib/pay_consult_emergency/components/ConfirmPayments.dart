import 'package:flutter/material.dart';
import 'package:tele_health/pay_consult_emergency/components/ConfirmButton.dart';
import 'package:tele_health/pay_consult_emergency/components/ItemsAndPrices.dart';

class ConfirmPayment extends StatelessWidget {
  ConfirmPayment();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.symmetric(horizontal: 22.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5.0,
      title: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                ' Continue with Payment   ',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 19.0,
                  letterSpacing: 1.0,
                ),
              ),
              // GestureDetector(
              //     onTap: () {
              //       Navigator.pop(context);
              //     },
              //     child: Image.asset('assets/icons8_cancel_50px.png')),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        ItemsAndPrices(
          item: 'Drug Prices',
          price: 2.00,
        ),
        ItemsAndPrices(
          item: 'Charges',
          price: 0.50,
        ),
        ItemsAndPrices(
          item: 'Total Charges',
          price: 2.50,
        ),
        ConfirmButton(
          onPressed: () {Navigator.pop(context);},
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
