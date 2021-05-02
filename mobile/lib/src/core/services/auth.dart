import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tele_health/Walkthrough/signupscreen.dart';
import 'package:tele_health/Walkthrough/loginScreen.dart';
import 'package:tele_health/Walkthrough/resetpasswordscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future signUp(nameOf, emailOf, passwordOf) async {
  var url =
      "https://tekcareapp.herokuapp.com/register"; //  http://127.0.0.1:3000
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Charset':'utf-8'
    },
    body: jsonEncode(<String, String>{
      'name': nameOf,
      'email': emailOf,
      'password': passwordOf,
    }),
  );
  //print(response.body);

  var res = json.decode(response.body);

  signUpResponse = res[0]["msg"];

  SharedPreferences prefs = await SharedPreferences.getInstance();

  var id = (res[0]["id"]).toString();
  var name = res[0]["name"];
  var email = res[0]["email"];
  var profile_image = res[0]["profile_image"];

  prefs.setString("id", id);
  prefs.setString("name", name);
  prefs.setString("email", email);
  prefs.setString("profile_image", profile_image);
}

Future login(nameOf, passwordOf) async {
  var url = "https://tekcareapp.herokuapp.com/login"; //  http://127.0.0.1:3000
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': nameOf,
      'password': passwordOf,
    }),
  );

  var res = json.decode(response.body);

  loginResponse = res[0]["msg"];

  SharedPreferences prefs = await SharedPreferences.getInstance();

  var id = (res[0]["id"]).toString();
  var name = res[0]["name"];
  var email = res[0]["email"];
  var profile_image = res[0]["profile_image"];

  prefs.setString("id", id);
  prefs.setString("name", name);
  prefs.setString("email", email);
  prefs.setString("profile_image", profile_image);
}

Future resetPassword(email, password) async {
  var url =
      "https://tekcareapp.herokuapp.com/resetpassword"; //  http://127.0.0.1:3000
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  resetPasswordResponse = response.body.toString();
}
