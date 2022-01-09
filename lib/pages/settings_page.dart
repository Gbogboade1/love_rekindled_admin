import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:love_rekindled_admin/ui_items/custom_input.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              onTap: () {
                showAddUserBottomSheet();
              },
              leading: Icon(
                CupertinoIcons.person_add_solid,
                size: 48,
              ),
              title: Text("Add another Admin"),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                showPasswordBottomSheet();
              },
              leading: Icon(
                CupertinoIcons.padlock_solid,
                size: 48,
              ),
              title: Text("Reset Password"),
            ),
          ),
        ],
      ),
    );
  }

  showAddUserBottomSheet() {
    _scaffoldKey.currentState.showBottomSheet<bool>(
      (context) => Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: <Widget>[
            Expanded(
                child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Card(
                child: Container(),
                color: Colors.transparent,
              ),
            )),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  children: <Widget>[
                    CustomInputField(
                      topLabel: "Enter Email address",
                      controller: null,
                      fieldSubmitted: (c) {},
                    ),
                    CustomInputField(
                      topLabel: "Enter Password",
                      controller: null,
                      fieldSubmitted: (c) {},
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Center(child: Text("Proceed")),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent
    );
  }

  showPasswordBottomSheet() {
    _scaffoldKey.currentState.showBottomSheet<bool>(
      (context) => Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: <Widget>[
            Expanded(
                child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Card(
                child: Container(),
                color: Colors.transparent,
              ),
            )),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
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
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
