import 'package:flutter/material.dart';
import 'package:tele_health/Walkthrough/loginScreen.dart';
import 'package:tele_health/components/inputField.dart';
import 'package:tele_health/components/walkThroughButtons.dart';
import 'package:tele_health/src/core/services/auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:tele_health/home_and_others/landing_page.dart';
import 'package:tele_health/components/err_message.dart';

var signUpResponse;
String contentText;

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool showSpinner = false;

  String name;
  String email;
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
    if (signUpResponse == "USER_EXISTS_BUT_NOT_VERIFIED") {
      contentText =
          "USER EXISTS BUT IS NOT VERIFIED. A VERIFICATION CODE HAS BEING SENT TO YOUR EMAIL .VERIFY YOUR EMAIL AND SIGN IN LATER";
    } else if (signUpResponse == "USER_EXISTS_AND_IS_VERIFIED") {
      contentText =
          "USER ALREADY EXISTS AND IS VERIFIED. PLEASE LOGIN WITH YOUR DETAILS. \n";
    }
  }

  @override
  Widget build(BuildContext context) {
    // checkToken() async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   String token = prefs.getString("accessToken");
    //   if (token != null) {
    //     // signUpResponse == "USER_CREATED_SUCCESSFULLY"
    //     // statusCode == "200"
    //     Navigator.of(context)
    //         .push(MaterialPageRoute(builder: (_) => Landing()));

    //     stopSpinner();
    //   }
    // }

    // checkToken();

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
                      child: Text("Welcome, enter your username and"),
                    ),
                  ),
                  Center(
                    child: Text("password to create an account."),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Sign up",
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
                  InputTextField(

                      onChanged: (value) {
                        email = value;
                      },
                      labelText: "Email Address",
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
                  SizedBox(
                    height: 20.0,
                  ),
                  WalkThroughButton(
                    label: "Sign up",
                    onTap: () async {
                      startSpinner();

                      if ((name == null) ||
                          (email == null) ||
                          (password == null)) {
                        getDialog('NO INPUT FIELD MUST BE LEFT EMPTY \n');

                        stopSpinner();
                      } else {
                        await signUp(name, email, password);
                        selectContentText();
                        print(signUpResponse);
                        if (signUpResponse == "USER_CREATED_SUCCESSFULLY") {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => Landing()));

                          stopSpinner();
                        } else if (signUpResponse ==
                            "USER_EXISTS_BUT_NOT_VERIFIED") {
                          stopSpinner();
                          getDialog("$contentText");
                        } else if (signUpResponse ==
                            "USER_EXISTS_AND_IS_VERIFIED") {
                          stopSpinner();
                          getDialog("$contentText");
                        } else {
                          getDialog(
                              'SOMETHING WENT WRONG. INPUT YOUR DETAILS AGAIN \nNO INPUT FIELD MUST BE LEFT EMPTY. \n');

                          stopSpinner();
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Center(
                    child: InkWell(
                      child: Text(
                        "Already have an account? Sign in",
                        style: TextStyle(color: Colors.green, fontSize: 16.0),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => LoginScreen()));
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
