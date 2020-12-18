import 'package:flutter/material.dart';
import 'package:notes_flutter/screens/home_page.dart';
import 'package:notes_flutter/screens/login_screen.dart';
import 'package:notes_flutter/screens/notes_screen.dart';
import 'package:notes_flutter/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (BuildContext context) => HomePage(),
        LoginScreen.id: (BuildContext context) => LoginScreen(),
        RegisterScreen.id: (BuildContext context) => RegisterScreen(),
        NotesScreen.id: (BuildContext context) => NotesScreen()
    },
  )
  );

}
