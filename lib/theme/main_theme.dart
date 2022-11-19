import 'package:flutter/material.dart';
import 'package:school_app/colors/colors.dart';

ThemeData mainTheme() {
  return ThemeData(
    primaryColor: Colors.deepPurple,
    // scaffoldBackgroundColor: const Color.fromRGBO(13, 17, 23, 1),
    scaffoldBackgroundColor: darkColor,
    brightness: Brightness.dark,
  );
}
// rgb(22,27,34)