import 'package:flutter/material.dart';
import 'package:love_rekindled_admin/pages/auth_forgot_password.dart';
import 'package:love_rekindled_admin/pages/home_page.dart';
import 'package:love_rekindled_admin/ui_items/general_ui_item.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        // physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          verticalSpace(height: MediaQuery.of(context).size.height * .2),
          Text(
            "Welcome back",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(
            height: 32,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Email Address",
            ),
          ),
          SizedBox(
            height: 8,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
            ),
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => AuthForgotPassword(),
                ),
              );
            },
            child: Text(
              "Forgot Password",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (c)=> HomePage()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Log in"),
              ],
            ),
            shape: StadiumBorder(),
          ),
        ],
      ),
    ),
    );
  }
}