import 'package:flutter/material.dart';
import 'package:tele_health/pay_consult_emergency/components/constants.dart';

class ItemsAndPrices extends StatelessWidget {
  ItemsAndPrices({@required this.item, @required this.price});

  final String item;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          item,
          style: kItemsAndPricesTextStyle,
        ),
        Text(
          '\$ $price',
          style: kItemsAndPricesTextStyle,
        ),
      ],
    );
  }
}
