import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:notes_flutter/components/constants.dart';
import 'package:notes_flutter/components/rounded_button.dart';
import 'package:notes_flutter/screens/notes_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              kTyperText,
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: "Enter your e-mail"),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(onPressed: () async {
                setState(() {
                  showSpinner = true;
                });
                try {

                  final user = await _auth.signInWithEmailAndPassword(
                      email: this.email, password: this.password);
                  if (user != null) {
                    Navigator.pushNamed(context, NotesScreen.id);
                  }
                  setState(() {
                    showSpinner = false;
                  });
                } on FirebaseAuthException catch (e) {
                  showDialog(context: context, builder: (context) => AlertDialog(
                    title: Text(e.message),
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0
                    ),
                    actions: <Widget>[
                      FlatButton(onPressed: () =>
                          Navigator.of(context).popUntil((route) =>
                          route
                              .isFirst), child: Text('OK'))
                    ],
                  ));
                  setState(() {
                    showSpinner = false;
                  });
                }
              }, title: 'Log in',
                // color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
