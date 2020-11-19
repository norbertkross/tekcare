import 'package:flutter/material.dart';


class OKButton extends StatelessWidget {

  OKButton({this.onPressed});
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed,
      child: Padding(
        padding: EdgeInsets.fromLTRB(68.0, 20.0, 68.0, 5.0),
        // EdgeInsets.symmetric(vertical: 15.0, horizontal: 68.0),
        child: Material(
          color: Color.fromRGBO(176, 6, 6, 1),
          borderRadius: BorderRadius.circular(10.0),
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'OK',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
