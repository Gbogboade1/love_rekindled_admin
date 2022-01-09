import 'package:flutter/material.dart';

class CounsellorModel {
  final String name;
  final String imageurl;
  final String emailAddress;
  final String about;
  final String schedules;

  CounsellorModel({
    @required this.name,
    @required this.imageurl,
    @required this.emailAddress,
    @required this.about,
    @required this.schedules,
  });
}
