import 'package:flutter/material.dart';

class CloseErrorMessageButton extends StatelessWidget {
  CloseErrorMessageButton();
  // final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Wrap(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 15),
              width: MediaQuery.of(context).size.width * 0.3,
              child: Material(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10.0),
                elevation: 5.0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Center(
                    child: Text(
                      'Close',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
