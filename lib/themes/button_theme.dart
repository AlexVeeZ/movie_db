import 'package:flutter/material.dart';

abstract class AppButtonTheme{
  static final ButtonStyle linkedButton = ButtonStyle(
    textStyle: MaterialStateProperty.all(
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    ),

  );

}