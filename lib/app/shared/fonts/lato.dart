import 'package:flutter/material.dart';

TextStyle lato = const TextStyle(
  fontFamily: "Lato",
);

TextStyle latoRegular({
  required double size,
  required Color color,
}) {
  return lato.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: size,
    color: color,
  );
}

TextStyle latoBold({
  required double size,
  required Color color,
}) {
  return lato.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: size,
    color: color,
  );
}
