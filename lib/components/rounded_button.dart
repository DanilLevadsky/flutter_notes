import 'package:flutter/material.dart';

import 'constants.dart';

//
// class RoundedButton extends StatelessWidget {
//   final Function onPressed;
//   final String title;
//   final Color color;
//   RoundedButton(
//       {@required this.onPressed, @required this.title, this.color});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 16.0),
//
//       child: Material(
//         color: Theme.of(context).backgroundColor.withBlue(100).withGreen(100).withAlpha(0xAA),
//         borderRadius: BorderRadius.circular(30.0),
//
//         elevation: 5.0,
//         child: MaterialButton(
//
//           onPressed: this.onPressed,
//           minWidth: 200.0,
//           height: 42.0,
//           child: Text(
//             title,
//             style: kButtonTextStyle,
//           ),
//         ),
//       ),
//     );
//   }
// }

class RoundedButton extends StatelessWidget {
  final Function onPressed;
  final String title;

  RoundedButton({@required this.onPressed, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.5),
          child: Text(
            title,
            style: kButtonTextStyle,
          ),
        ),
        color: Theme.of(context).backgroundColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(40.0)),
      ),
    );
  }
}
