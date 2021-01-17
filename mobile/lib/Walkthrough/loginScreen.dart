import 'package:flutter/material.dart';
import 'package:tele_health/components/inputField.dart';
import 'package:tele_health/components/walkThroughButtons.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                "Welcome, use your username and"),
            ),
          ),
          Center(
            child: Text("password to sign in."),
          ),
          SizedBox(height: 25.0,),
          Row(
            children: [
              Text("Sign in", style: TextStyle(
                fontSize: 20
              ),),
            ],
          ),
          SizedBox(height: 30.0,),
          InputTextField(labelText: "username", textInputType: TextInputType.text),
          SizedBox(height: 15.0,),
          InputTextField(labelText: "password", textInputType: TextInputType.visiblePassword),
          SizedBox(height: 20.0,),
          WalkThroughButton(label: "Sign in", onTap: (){},),
          SizedBox(height: 10.0,),
          Center(
            child: InkWell(
              child: Text(
                "Forgot Password?",
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