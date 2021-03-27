import 'package:flutter/material.dart';

// Box Decorations

BoxDecoration activeBox = BoxDecoration(
    color: Color(0xff8ba3e0),
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
          color: Colors.black26,
          offset: Offset(0, 2),
          blurRadius: 6.0
      )
    ]
);

BoxDecoration disabledBox = BoxDecoration(
    color: Color(0xff8ba3e0).withOpacity(0.6),
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
          color: Colors.black26,
          offset: Offset(0, 2),
          blurRadius: 6.0
      )
    ]
);

BoxDecoration fieldDecoration = BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Color(0xff8ba3e0), boxShadow: [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 2.0),
    blurRadius: 6.0
  )
]);
BoxDecoration disabledFieldDecoration = BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Color(0xff8ba3e0).withOpacity(0.9), boxShadow: [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 2.0),
    blurRadius: 6.0
  )
]);


// Field Variables

const double fieldHeight = 60.0;
const double smallFieldHeight = 40.0;
const double inputFieldBottomMargin = 30.0;
const double inputFieldSmallBottomMargin = 0;
const EdgeInsets fieldPadding = const EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets largeFieldPadding = const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0);

// TextStyle Variables

const TextStyle buttonTitleTextStyle = const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.5);
const TextStyle headerOneStyle = const TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 25.0);

