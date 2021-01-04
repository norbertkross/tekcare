import 'package:flutter/material.dart';
import 'package:tele_health/components/inputField.dart';
import 'package:tele_health/components/walkThroughButtons.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 80, left: 25.0, right: 25.0),
            child: Column(
              children: [
                Center(
            child: Text(
              "We Say Hello!",
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 25.0,),
          Center(
            child: Container(
              child: Text(
                "Welcome, enter your username and"),
            ),
          ),
          Center(
            child: Text("password to create an account."),
          ),
          SizedBox(height: 10.0,),
          Row(
            children: [
              Text("Sign up", style: TextStyle(
                fontSize: 20
              ),),
            ],
          ),
          SizedBox(height: 30.0,),
          InputTextField(labelText: "username", textInputType: TextInputType.text),
          SizedBox(height: 10.0,),
          InputTextField(labelText: "password", textInputType: TextInputType.visiblePassword),
          SizedBox(height: 20.0,),
          WalkThroughButton(label: "Sign up", onTap: (){},),
          SizedBox(height: 10.0,),
          Center(
            child: InkWell(
              child: Text(
                "Already have an account? Sign in",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 14.0
                ),),
                onTap: (){},
            ),
          )
              ],
            ),
          )
        ],
      ),
    );
  }
}