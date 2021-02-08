import 'package:flutter/material.dart';
import 'package:tele_health/Walkthrough/resetpasswordscreen.dart';
import 'package:tele_health/components/inputField.dart';
import 'package:tele_health/components/walkThroughButtons.dart';
import 'package:tele_health/home_and_others/landing_page.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:tele_health/components/err_message.dart';
import 'package:tele_health/src/core/services/auth.dart';
//import 'package:shared_preferences/shared_preferences.dart';

String contentText;
var loginResponse;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;

  String name;
  String password;

  void stopSpinner() {
    setState(() {
      showSpinner = false;
    });
  }

  void startSpinner() {
    setState(() {
      showSpinner = true;
    });
  }

  void getDialog(String contentText) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ErrorMessage(contentText: '$contentText');
        });
  }

  void selectContentText() {
    if (loginResponse == "USER_DOESN'T_EXIST") {
      contentText = "USER DOESN'T EXIST.PLEASE INPUT YOUR DETAILS AGAIN";
    } else if (loginResponse == "USER_EXISTS_BUT_EMAIL_IS_NOT_VERIFIED") {
      contentText =
          "EMAIL NOT VERIFIED YET. MAKE SURE TO VERIFY BEFORE YOU LOG IN. \n";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 80, left: 25.0, right: 25.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "We Say Hello!",
                      style: TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Center(
                    child: Container(
                      child: Text("Welcome, use your username and"),
                    ),
                  ),
                  Center(
                    child: Text("password to sign in."),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Sign in",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  InputTextField(
                      onChanged: (value) {
                        name = value;
                      },
                      labelText: "username",
                      textInputType: TextInputType.text),
                  SizedBox(
                    height: 15.0,
                  ),
                  PasswordInputTextField(
                      onChanged: (value) {
                        password = value;
                      },
                      labelText: "password",
                      textInputType: TextInputType.visiblePassword),
                  WalkThroughButton(
                    label: "Sign in",
                    onTap: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      if ((name == null) || (password == null)) {
                        getDialog('NO INPUT FIELD MUST BE LEFT EMPTY \n');
                        stopSpinner();
                      } else {
                        await login(name,password);
                        //print("Response body in widget " + loginResponse);

                        selectContentText();
                        if (loginResponse ==
                            "USER_EXISTS_AND_EMAIL_IS_VERIFIED") {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => Landing()));
                          stopSpinner();
                        }else if(loginResponse == "USER_EXISTS_BUT_EMAIL_IS_NOT_VERIFIED"){
                          getDialog("$contentText");
                          stopSpinner();
                        }
                         else if(loginResponse == "USER_DOESN'T_EXIST") {
                          getDialog("$contentText");
                          stopSpinner();
                        } 
                      }
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: InkWell(
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.green, fontSize: 14.0),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ResetPasswordScreen()));
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
