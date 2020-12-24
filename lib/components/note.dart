import 'package:flutter/material.dart';

class Note {
  String title;
  String text;
  String editedTime;
  Color color;

  Note(
      {@required this.title,
      @required this.text,
      @required this.color,
      this.editedTime});
}