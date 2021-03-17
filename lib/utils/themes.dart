import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    centerTitle: false,
    backgroundColor: Color(0xff1c2850),
    elevation: 0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 18,
      backgroundColor: Color(0xff7492b4),
      fontWeight: FontWeight.bold,
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontSize: 18,
    ),
    headline5: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    centerTitle: false,
    backgroundColor: Color(0xff1c2850),
    elevation: 0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 18,
      backgroundColor: Color(0xff7492b4),
      fontWeight: FontWeight.bold,
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontSize: 18,
    ),
    headline5: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  ),
);
