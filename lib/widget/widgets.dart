import 'package:flutter/material.dart';
import 'package:iamnaveenoff/utils/colors.dart';

BoxDecoration boxDecoration({double radius = 80.0, Color? backGroundColor = opPrimaryColor, double blurRadius = 8.0, double spreadRadius = 8.0, shadowColor = Colors.black12}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [BoxShadow(color: shadowColor, blurRadius: blurRadius, spreadRadius: spreadRadius)],
    color: backGroundColor,
  );
}