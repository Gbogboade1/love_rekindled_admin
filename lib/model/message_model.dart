import 'package:flutter/material.dart';

class MessageModel {
  final String senderId;
  final String date;
  final String message;
  final bool isDelivered;
  final bool isRead;

  MessageModel({
    @required this.senderId,
    this.date = "June 27",
    @required  this.message,
    this.isDelivered = false,
    this.isRead = false,
  });
}
