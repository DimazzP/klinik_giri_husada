import 'package:flutter/material.dart';

class FittedFont {
  double? extraSmall;
  double? small;
  double? medium;
  double? large;
  double? extraLarge;
  FittedFont(BuildContext context) {
    if (MediaQuery.of(context).size.width <= 800) {
      extraSmall = 12;
      small = 14;
      medium = 16;
      large = 18;
      extraLarge = 24;
    } else {
      extraSmall = 15;
      small = 17;
      medium = 19;
      large = 21;
      extraLarge = 27;
    }
  }
}
