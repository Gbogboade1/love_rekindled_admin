import 'package:flutter/material.dart';

class BodyItem {
  final Color color;
  final IconData icon;
  final String title;
  final Widget page;

  BodyItem({
    @required this.color,
    @required this.icon,
    @required this.title,
    @required this.page,
  });
}
