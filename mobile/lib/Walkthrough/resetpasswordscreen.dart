import 'package:flutter/material.dart';
import 'package:tele_health/components/inputField.dart';
import 'package:tele_health/components/walkThroughButtons.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            Container(
          child: Column(
            children: [
              Text("We Say Hello!", style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold
              ),),
              Text("Enter your new password"),
              SizedBox(height: 20.0,),
              InputTextField(labelText: "password", textInputType: TextInputType.visiblePassword),
              SizedBox(height: 6.0,),
              InputTextField(labelText: " confirm password", textInputType: TextInputType.visiblePassword),
              SizedBox(height: 15.0,),
              WalkThroughButton(label: "Reset", onTap: (){},)
            ],
          ),
        ),
          ],
      ),
    );
  }
}