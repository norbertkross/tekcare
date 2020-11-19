import "package:flutter/material.dart";

class Consultation extends StatefulWidget {
  Consultation({
    Key key,
  }) : super(key: key);

  @override
  _ConsultationState createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Consultation',
            ),
          ],
        ),
      ),
    );
  }
}
