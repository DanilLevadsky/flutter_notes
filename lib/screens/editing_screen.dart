import 'package:flutter/material.dart';
import 'package:notes_flutter/components/constants.dart';
// import 'package:notes_flutter/components/note.dart';

class EditingScreen extends StatefulWidget {
  static const String id = 'editing_screen';

  @override
  _EditingScreenState createState() => _EditingScreenState();
}

class _EditingScreenState extends State<EditingScreen> {
  // Note _note;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: Theme.of(context).backgroundColor,
        actions: [
          FlatButton(
            onPressed: null,
            child: Icon(Icons.check, color: Colors.black, size: 35.0),
            minWidth: 75.0,
          )
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
