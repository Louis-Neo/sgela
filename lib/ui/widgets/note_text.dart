import 'package:flutter/material.dart';

class NoteText extends StatelessWidget {

  final String text;
  final TextAlign textAlign;
  final Color colour;

  const NoteText(this.text, {this.textAlign, this.colour});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: colour ?? Colors.grey[600]
      ),
    );
  }
}
