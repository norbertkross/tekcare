import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalkThroughButton extends StatelessWidget {
  final String label;
  final Function onTap;

  WalkThroughButton({
    this.label,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: 250.0,
        child: RaisedButton(
        color: Theme.of(context).primaryColor,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5)
          ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}