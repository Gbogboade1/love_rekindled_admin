import 'package:flutter/material.dart';

class AuthForgotPassword extends StatefulWidget {
  @override
  _AuthForgotPasswordState createState() => _AuthForgotPasswordState();
}

class _AuthForgotPasswordState extends State<AuthForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Icon(
              Icons.lock_open,
              size: 64,
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                "Forgot Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            SizedBox(height: 32),
            Center(
              child: Text(
                "Enter your email address nd we will send you a link to reset your password.",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Email Address",
              ),
            ),
            SizedBox(
              height: 16,
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Send"),
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
