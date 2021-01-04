import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  /// A class that returns a textformfield widget
  /// it accepts a an icon widget,text, keyboardinput type  as an argument
  /// the icon widget would be used as the  icon
  /// the text would be used as the label text

  final String labelText;
  final TextInputType textInputType;

  InputTextField({@required this.labelText,@required this.textInputType});
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
            labelText: labelText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            )
        ),
        keyboardType: textInputType,
      );
  }
}