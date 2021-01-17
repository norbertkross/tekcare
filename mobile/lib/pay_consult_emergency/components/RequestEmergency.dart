import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RequestEmergency extends StatelessWidget {

  RequestEmergency({@required this.title, @required this.contentText,this.startSpinner});
  final String title;
  final String contentText;
  final bool startSpinner;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5.0,
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Color.fromRGBO(176, 6, 6, 1),
            fontSize: 25.0,
            letterSpacing: 1.0,
          ),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
          horizontal: 30.0, vertical: 20.0),
      content: Text(
        contentText,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
      actions: <Widget>[
        Container(
          child: startSpinner == true ? SpinKitFadingCircle(
            color: Colors.grey,
            size: 80.0,
          ) : null,
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.symmetric(horizontal: 120.0,vertical: 5.0),
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
