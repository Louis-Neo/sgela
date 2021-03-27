import 'package:flutter/material.dart';

const Widget tinyHorizontalSpace = SizedBox(width: 5.0);
const Widget smallHorizontalSpace = SizedBox(width: 10.0);
const Widget mediumHorizontalSpace = SizedBox(width: 25.0);

const Widget tinyVerticalSpace = SizedBox(height: 5.0);
const Widget smallVerticalSpace = SizedBox(height: 10.0);
const Widget mediumVerticalSpace = SizedBox(height: 30.0);
const Widget largeVerticalSpace = SizedBox(height: 50.0);
const Widget hugeVerticalSpace = SizedBox(height: 110.0);

Widget spacedDivider = Column(
  children: [
    mediumVerticalSpace,
    const Divider(color: Colors.white70, height: 5.0),
    mediumVerticalSpace
  ]
);

Widget verticalSpace(double height) => SizedBox(height: height);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.width;

double heightFraction(BuildContext context, {int dividedBy = 1, double offsetBy = 0}) => (screenHeight(context) - offsetBy)/dividedBy;
double widthFraction(BuildContext context, {int dividedBy = 1, double offsetBy = 0}) => (screenHeight(context) - offsetBy)/dividedBy;

double halfWidth(BuildContext context) => widthFraction(context, dividedBy: 2);
double thirdWidth(BuildContext context) => widthFraction(context, dividedBy: 3);
