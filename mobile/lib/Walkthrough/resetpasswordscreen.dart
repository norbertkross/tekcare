import 'package:flutter/material.dart';
import 'package:tele_health/components/inputField.dart';
import 'package:tele_health/components/walkThroughButtons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:tele_health/src/core/services/auth.dart';
import 'package:tele_health/Walkthrough/loginScreen.dart';
import 'package:tele_health/components/err_message.dart';

//String statusCode;
String resetPasswordResponse;
String contentText;

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool showSpinner = false;

  String email;
  String password;
  String confirmPassword;

  void getDialog(String contentText) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ErrorMessage(contentText: '$contentText');
        });
  }

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

  void selectContentText() {
    if (resetPasswordResponse == "ERROR") {
      contentText = "An Error Occured";
    } else if (resetPasswordResponse == 'PASSWORD_RESET_SUCCESSFUL') {
      contentText =
          "PASSWORD HAS SUCCESSFULLY BEING RESET.TRY LOGGING IN AGAIN WITH YOUR NEW PASSWORD";
    } else if (resetPasswordResponse ==
        'USER_EXISTS_BUT_EMAIL_IS_NOT_VERIFIED') {
      contentText =
          "EMAIL NOT VERIFIED YET. MAKE SURE TO VERIFY YOUR EMAIL BEFORE YOU TRY TO RESET YOUR PASSWORD";
    } else if (resetPasswordResponse == "USER_DOESN'T_EXISTS") {
      contentText = "USER DOESN'T EXIST.";
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
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  SizedBox(
                    height: 100.0,
                  ),
                  Text(
                    "We Say Hello!",
                    style:
                        TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 26.0,
                  ),
                  InputTextField(
                      onChanged: (value) {
                        email = value;
                      },
                      labelText: "Email Address",
                      textInputType: TextInputType.text),
                  SizedBox(
                    height: 16.0,
                  ),
                  PasswordInputTextField(
                      labelText: "Enter your new password",
                      onChanged: (value) {
                        password = value;
                      },
                      textInputType: TextInputType.visiblePassword),
                  SizedBox(
                    height: 16.0,
                  ),
                  PasswordInputTextField(
                      labelText: " Confirm your new password",
                      onChanged: (value) {
                        confirmPassword = value;
                      },
                      textInputType: TextInputType.visiblePassword),
                  SizedBox(
                    height: 25.0,
                  ),
                  WalkThroughButton(
                    label: "Reset",
                    onTap: () async {
                      startSpinner();

                      if ((email == null ||
                          password == null ||
                          confirmPassword == null)) {
                        getDialog('No input Field must be left empty \n');
                        stopSpinner();
                      } else {
                        if (password == confirmPassword) {
                          await resetPassword(email, password);
                          selectContentText();

                          if (resetPasswordResponse ==
                              "USER_EXISTS_BUT_EMAIL_IS_NOT_VERIFIED") {
                            stopSpinner();
                            getDialog("$contentText");
                          } else if (resetPasswordResponse ==
                              "USER_DOESN'T_EXISTS") {
                            stopSpinner();
                            getDialog("$contentText");
                          } else if (resetPasswordResponse ==
                              "PASSWORD_RESET_SUCCESSFUL") {
                            stopSpinner();
                            getDialog("$contentText");
                          }
                        } else {
                          stopSpinner();
                          getDialog('• No input field must be left empty.\n'
                              '\n'
                              '• Password and Confirm  password must match and must be at least 6 characters long\n'
                              '\n'
                              '• Make sure to input a correct email address');
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
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
            ),
          ],
        ),
      ),
    );
  }
}
