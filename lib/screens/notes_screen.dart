import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_flutter/components/constants.dart';
import 'package:notes_flutter/components/note.dart';
import 'package:notes_flutter/components/note_tile.dart';
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
      body: StreamBuilder(
        stream: _firestore.collection(this.loggedInUser.email).orderBy(
            'editedTime', descending: true).snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(child: Text('Empty', style: kTitleTextStyle,),)
              : ListView.builder(
            itemBuilder: (context, index) {
              var document = snapshot.data.documents[index].data();
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0
                ),
                child: NoteTile(
                  note: Note(
                    title: document['title'],
                    text: document['text'],
                    color: Color(
                      int.parse(document['color']),
                    ),
                    editedTime: document['editedTime'],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            EditingScreen.load(note: Note(
                                title: document['title'],
                                text: document['text'],
                                color: Color(
                                  int.parse(document['color']),
                                )), noteId: snapshot.data.documents[index].id,)
                    ));
                  },
                ),
              );
            },
            itemCount: snapshot.data.documents.length,
          );
        },
      ),
    );
  }

}
