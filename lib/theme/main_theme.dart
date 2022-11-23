import 'package:flutter/material.dart';
import 'package:school_app/colors/colors.dart';

ThemeData mainTheme() {
  return ThemeData(
    primaryColor: Colors.deepPurple,
    // scaffoldBackgroundColor: const Color.fromRGBO(13, 17, 23, 1),
    scaffoldBackgroundColor: darkColor,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(
        color: Colors.white,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
      ),
    ),
  );
}
