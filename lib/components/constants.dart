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
    isRepeatingAnimation: false,
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

const kColors = [
  Color(0xFFF2D7D5),
  Color(0xFFF5B7B1),
  Color(0xFFD7BDE2),
  Color(0xFFA9CCE3),
  Color(0xFFA3E4D7),
  Color(0xFFF9E79F),
  Color(0xFFF5CBA7),
  Color(0xFFE5E7E9),
  Color(0xFFF1948A),
  Color(0xFFEAF2F8),
  Color(0xFFF5CBA7),
  Color(0xFFCD6155),
  Color(0xFFF7DC6F),
  Color(0xFFCCD1D1),
  Color(0xFF808B96),
];