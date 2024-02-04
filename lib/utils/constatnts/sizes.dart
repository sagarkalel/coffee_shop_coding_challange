import 'package:flutter/material.dart';

class Sizes {
  static double screenY(context) => MediaQuery.of(context).size.height;
  static double screenX(context) => MediaQuery.of(context).size.width;
  static double bottomInsectHeight(context) =>
      MediaQuery.of(context).viewInsets.bottom;
}
