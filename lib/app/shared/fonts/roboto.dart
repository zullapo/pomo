import 'package:flutter/material.dart';

TextStyle roboto = const TextStyle(
  fontFamily: "Roboto",
);

TextStyle robotoRegular({
  required double size,
  required Color color,
}) {
  return roboto.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: size,
    color: color,
  );
}

TextStyle robotoMedium({
  required double size,
  required Color color,
}) {
  return roboto.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: size,
    color: color,
  );
}

TextStyle robotoBold({
  required double size,
  required Color color,
}) {
  return roboto.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: size,
    color: color,
  );
}
