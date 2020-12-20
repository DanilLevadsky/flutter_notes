import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_flutter/components/constants.dart';
import 'package:notes_flutter/screens/editing_screen.dart';

class NotesScreen extends StatefulWidget {
  static const String id = 'notes_screen';

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        leading: FlatButton(
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
              size: 35.0,
            ),
            onPressed: () => Navigator.of(context).pop()),
        title: Text(
          'Notes',
          style: kButtonTextStyle,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.amber[200],
        elevation: 15.0,
        onPressed: () {
          Navigator.pushNamed(context, EditingScreen.id);
        },
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: double.infinity),
          itemBuilder: (context, id) {
            return StreamBuilder(
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final note = snapshot.data.docs;
                return Container(
                  color: Color(int.parse(note.data()['color'])),
                  child: Column(
                    children: [
                      Expanded(
                        child: Text(note.data()['title']),
                        flex: 1,
                      ),
                      Expanded(
                        child: Text(note.data()['text']),
                        flex: 5,
                      )
                    ],
                  ),
                );
              },
              stream: _firestore.collection('notes').snapshots(),
            );
          }),
    );
  }
}

