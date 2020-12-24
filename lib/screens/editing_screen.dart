import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_flutter/components/color_button.dart';
import 'package:notes_flutter/components/constants.dart';
import 'package:notes_flutter/components/note.dart';

// ignore: must_be_immutable
class EditingScreen extends StatefulWidget {
  static const String id = 'editing_screen';
  Note note;
  String noteId;

  EditingScreen();

  EditingScreen.load({this.note, this.noteId});

  @override
  _EditingScreenState createState() => _EditingScreenState();
}

class _EditingScreenState extends State<EditingScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController textController = TextEditingController();
  String title;
  String text;
  Color color;
  final _formKey = GlobalKey<FormState>();
  User user;
  FirebaseFirestore firestore;

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      this.title = widget.note.title;
      this.text = widget.note.text;
      this.color = widget.note.color;
      textController.text = widget.note.text;
      titleController.text = widget.note.title;
    } else {
      this.color = kBackgroundColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    user = FirebaseAuth.instance.currentUser;
    firestore = FirebaseFirestore.instance;
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          leading: FlatButton(
            child: Icon(Icons.arrow_back_ios_rounded,
                color: Colors.black, size: 35.0),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Notes',
            style: kButtonTextStyle,
          ),
          backgroundColor: color,
          actions: [
            FlatButton(
                onPressed: () {
                  if (widget.note != null) {
                    firestore
                        .collection(user.email)
                        .doc(widget.noteId)
                        .delete();
                  }
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.black,
                )),
            FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  try {
                    if (widget.note != null) {
                      firestore
                          .collection(user.email)
                          .doc(widget.noteId)
                          .update({
                        'title': this.title,
                        'text': this.text,
                        'color': this.color.value.toString(),
                        'editedTime':
                            DateFormat('dd-MM-yyyy').format(DateTime.now())
                      });
                    } else {
                      firestore.collection(user.email).add({
                        'title': this.title,
                        'text': this.text,
                        'color': this.color.value.toString(),
                        'editedTime':
                            DateFormat('dd-MM-yyyy').format(DateTime.now())
                      });
                    }
                    Navigator.pop(context);
                  } catch (e) {
                    print(e);
                  }
                }
              },
              child: Icon(Icons.check, color: Colors.black, size: 35.0),
              minWidth: 75.0,
            )
          ],
        ),
        backgroundColor: color,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty || value == null) {
                      return 'Title is empty';
                    }
                    return null;
                  },
                  maxLength: 64,
                  maxLines: null,
                  decoration: kTitleFieldDecoration,
                  onChanged: (title) {
                    this.title = titleController.value.text;
                  },
                  controller: titleController,
                  cursorColor: Colors.black,
                  style: kTitleTextStyle,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.5),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty || value == null) {
                      return 'Text is empty';
                    }
                    return null;
                  },
                  maxLength: 500,
                  maxLines: null,
                  decoration: kNoteFieldDecoration,
                  controller: textController,
                  onChanged: (text) {
                    this.text = textController.value.text;
                  },
                  cursorColor: Colors.black,
                  style: kNoteTextStyle,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.black, width: 1.5)),
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: kColors.length,
            itemBuilder: (context, index) {
              return ColorButton(
                color: kColors[index],
                radius: 45.0,
                onTap: () {
                  setState(() {
                    this.color = kColors[index];
                  });
                },
              );
            },
          ),
        ),
      ),
    );
  }

}
