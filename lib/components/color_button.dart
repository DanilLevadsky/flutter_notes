import 'package:flutter/material.dart';

class ColorButton extends StatefulWidget {
  final double radius;
  final Color color;
  final int id;
  final GestureTapCallback onTap;

  ColorButton({this.color, this.onTap, this.radius, this.id});

  @override
  _ColorButtonState createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: InkResponse(
          onTap: widget.onTap,
          child: Container(
            width: widget.radius,
            height: widget.radius,
            decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 1.25),
            ),
          )),
    );
  }
}
