import 'package:flutter/material.dart';

TextStyle latoW400({
  required double size,
  required Color color,
}) {
  return TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: "Lato",
    fontSize: size,
    color: color,
  );
}