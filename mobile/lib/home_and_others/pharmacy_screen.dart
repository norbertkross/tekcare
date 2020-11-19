import "package:flutter/material.dart";

class Pharmacy extends StatefulWidget {
  Pharmacy({Key key,/*  this.title */}) : super(key: key);


  @override
  _PharmacyState createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pharmacy',
            ),
          ],
        ),
      ),
    );
  }

}
