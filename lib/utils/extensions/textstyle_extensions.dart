import 'package:flutter/material.dart';

extension Textstyles on TextStyle {
  TextStyle textColor(Color color) => copyWith(color: color);
  TextStyle textSize(double size) => copyWith(fontSize: size);
  TextStyle weight(FontWeight weight) => copyWith(fontWeight: weight);
  TextStyle textOverflow(TextOverflow overflow) => copyWith(overflow: overflow);
  TextStyle fontFamily(String fontFamily) => copyWith(fontFamily: fontFamily);
}
