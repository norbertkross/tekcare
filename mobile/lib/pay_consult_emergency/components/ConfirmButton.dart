import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {

  ConfirmButton({this.onPressed});
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed,
      child: Padding(
        padding: EdgeInsets.fromLTRB(80.0, 20.0, 80.0, 5.0),
        child: Material(
          color: Color.fromRGBO(176, 6, 6, 1),
          borderRadius: BorderRadius.circular(10.0),
          elevation: 5.0,
          child: Padding(
            padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Confirm',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
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
