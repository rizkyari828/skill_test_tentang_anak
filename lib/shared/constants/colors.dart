import 'package:flutter/material.dart';

class ColorConstants {
  static const Color lightScaffoldBackgroundColor = Color(0xFFFFFFFF);
  static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  static Color secondaryAppColor = hexToColor('#22DDA6');
  static Color secondaryDarkAppColor = Colors.white;
  static Color tipColor = hexToColor('#B6B6B6');
  static Color lightGray = Color(0xFFF6F6F6);
  static Color darkGray = Color(0xFF9F9F9F);
  static const Color black = Colors.black87;
  static Color white = Color(0xFFFFFFFF);
  static const Color mainColor = Color(0xFFB5926C);
  static const Color disableButton = Color.fromRGBO(200, 200, 200, 1.0);
  static Color backgroundTextField = hexToColor('#EDF0F4');
  static const Color colorSilver = Color.fromRGBO(180, 180, 180, 1.0);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
