import 'package:flutter/material.dart';
import 'package:notes_flutter/components/constants.dart';
import 'package:notes_flutter/components/note.dart';

class NoteTile extends StatelessWidget {
  final Note note;
  final Function onTap;

  NoteTile({this.note, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: note.color,
            border: Border.all(color: Colors.black, width: 2.5),
            borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
        child: Column(
          children: [
            Text(note.title, style: kTitleTextStyle),
            Divider(
              thickness: 3.0,
              height: 7.0,
              color: Color(0x11121212),
            ),
            Text(
              note.text,
              style: kNoteTextStyle,
            ),
            Divider(thickness: 3.0, height: 7.0, color: Color(0x11121212)),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                note.editedTime.toString(),
                style: kNoteTextStyle,
              ),
            )
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
