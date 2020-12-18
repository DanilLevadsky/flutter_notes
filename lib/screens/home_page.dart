import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:notes_flutter/components/rounded_button.dart';
import 'package:notes_flutter/screens/register_screen.dart';

import 'login_screen.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: TyperAnimatedTextKit(
                  text: ['Notes'],
                  speed: Duration(milliseconds: 1000),
                  textStyle: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'BreeSerif')),
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              title: 'Log in',
              color: Colors.lightBlueAccent,
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, RegisterScreen.id);
              },
              title: 'Sign up',
            )
          ],
        ),
      ),
    );
  }
}
