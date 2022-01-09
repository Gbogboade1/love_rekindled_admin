
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

pushRoute(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (c) => page));
}

Widget verticalSpace({double height = 8}) {
  return SizedBox(height: height);
}

Widget horizontalSpace({double width = 8}) {
  return SizedBox(width: width);
}

Widget showTimerIcon(context) {
  return InkWell(
    onTap: () {
      // Navigator.push(context, MaterialPageRoute(builder: (c) => TimerPage()));
    },
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Image.asset(
        "assets/hourglass.png",
        color: Colors.white,
      ),
    ),
  );
}

