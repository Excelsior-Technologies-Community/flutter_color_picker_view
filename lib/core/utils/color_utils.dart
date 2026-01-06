import 'package:flutter/material.dart';

class ColorUtils {
  static bool isDark(Color color) {
    return color.computeLuminance() < 0.5;
  }
}
