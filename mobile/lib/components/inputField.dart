import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {

  /// A class that returns a textformfield widget
  /// it accepts a an icon widget,text, keyboardinput type  as an argument
  /// the icon widget would be used as the  icon
  /// the text would be used as the label text

  final String labelText;
  final TextInputType textInputType;
  final Function onChanged;
  

  InputTextField({@required this.labelText,@required this.textInputType,@required this.onChanged});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.09,
      child: TextFormField(
          onChanged: onChanged,
          decoration: InputDecoration(
              labelText: labelText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              )
          ),
          keyboardType: textInputType,
        ),
    );
  }
}




class PasswordInputTextField extends StatelessWidget {

  /// A class that returns a textformfield widget
  /// it accepts a an icon widget,text, keyboardinput type  as an argument
  /// the icon widget would be used as the  icon
  /// the text would be used as the label text

  final String labelText;
  final TextInputType textInputType;
  final Function onChanged;
  

  PasswordInputTextField({@required this.labelText,@required this.textInputType,@required this.onChanged});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.09,
      child: TextFormField(
        obscureText: true,
          onChanged: onChanged,
          decoration: InputDecoration(
              labelText: labelText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              )
          ),
          keyboardType: textInputType,
        ),
    );
  }
}




