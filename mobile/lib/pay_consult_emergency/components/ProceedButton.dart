import 'package:flutter/material.dart';

class ProceedButton extends StatelessWidget {

  ProceedButton({this.onPress});

  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 58.0),
        child: Material(
          color: Color.fromRGBO(176, 6, 6, 1),
          borderRadius: BorderRadius.circular(45.0),
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Proceed ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 30.0,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
