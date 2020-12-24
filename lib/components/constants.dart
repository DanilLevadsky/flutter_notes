import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

final kBackgroundColor = Colors.lime[100];

final kButtonTextStyle = TextStyle(
    color: Colors.black,
    fontFamily: "Dosis",
    fontSize: 25.0,
    fontWeight: FontWeight.bold);

final kLoginTextFieldDecoration = InputDecoration(
  hintText: '',
  hintStyle: TextStyle(color: Color(0xFF404040)),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black54, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black54, width: 2.5),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

final kTyperText = TyperAnimatedTextKit(
    text: ['Notes'],
    speed: Duration(milliseconds: 1000),
    textStyle: TextStyle(
        fontSize: 50.0, fontWeight: FontWeight.w700, fontFamily: 'BreeSerif'));

final kTitleFieldDecoration = InputDecoration(
  errorStyle: kTitleTextStyle.copyWith(fontSize: 15),
  hintText: 'Title',
  hintStyle: TextStyle(color: Color(0xFF404040)),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: UnderlineInputBorder(),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black54, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black54, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

final kNoteFieldDecoration = InputDecoration(
  errorStyle: kNoteTextStyle.copyWith(fontSize: 12.0),
  hintText: 'Text',
  hintStyle: TextStyle(color: Color(0xFF404040)),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: UnderlineInputBorder(),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black54, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black54, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

final kTitleTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontSize: 25.0,
  fontFamily: 'Dosis',
);

final kNoteTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 18.0,
    fontFamily: 'Dosis');
