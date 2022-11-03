import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTheme {
  static final customTheme = ThemeData(
      primaryColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        headline5: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        headline6: TextStyle(
          color: Color(0xff9f9f9f),
          fontSize: 16,
        ),
      ));
}
