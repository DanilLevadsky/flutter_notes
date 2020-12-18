import 'dart:convert';
import 'dart:ui';

class Note {
  int id;
  DateTime createdTime;
  DateTime editedTime;
  String title;
  String text;
  Color color;

  Note({this.id,
        this.createdTime,
        this.editedTime,
        this.title,
        this.text,
        this.color});

  Map<String, dynamic> toMap() {
    return {
      'title': utf8.encode(title),
      'text': utf8.encode(text),
      'createdTime': createdTime,
      'editedTime': editedTime,
      'color': color.value
    };
  }

}
