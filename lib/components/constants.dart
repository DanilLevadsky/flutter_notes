import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

const kButtonTextStyle = TextStyle(
    color: Colors.black,
    fontFamily: "Dosis",
    fontSize: 25.0,
    fontWeight: FontWeight.bold);
const kTextFieldDecoration = InputDecoration(
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
const kTyperText = TyperAnimatedTextKit(
    text: ['Notes'],
    speed: Duration(milliseconds: 1000),
    textStyle: TextStyle(
        fontSize: 50.0, fontWeight: FontWeight.w700, fontFamily: 'BreeSerif'));
