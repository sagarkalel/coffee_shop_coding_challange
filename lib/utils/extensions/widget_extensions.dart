import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  /// padding
  Widget padXX(double xx) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: xx), child: this);
  Widget padYY(double yy) =>
      Padding(padding: EdgeInsets.symmetric(vertical: yy), child: this);
  Widget padXLeft(double x) =>
      Padding(padding: EdgeInsets.only(left: x), child: this);
  Widget padXRight(double x) =>
      Padding(padding: EdgeInsets.only(right: x), child: this);
  Widget padYLeft(double y) =>
      Padding(padding: EdgeInsets.only(left: y), child: this);
  Widget padYRight(double y) =>
      Padding(padding: EdgeInsets.only(right: y), child: this);
  Widget padYTop(double y) =>
      Padding(padding: EdgeInsets.only(top: y), child: this);
  Widget padYBottom(double y) =>
      Padding(padding: EdgeInsets.only(bottom: y), child: this);
  Widget padAll(double all) =>
      Padding(padding: EdgeInsets.all(all), child: this);
}

/// gap
Widget xGap(double x) => SizedBox(width: x);
Widget yGap(double y) => SizedBox(height: y);
