import 'package:flutter/material.dart';

class EventsModel {
  final String title;
  final String date;
  final String imageUrl;
  final String description;

  EventsModel({
    @required this.title,
    @required this.date,
    @required this.imageUrl,
    @required this.description,
  });
}
