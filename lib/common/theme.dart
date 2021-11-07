import 'package:flutter/material.dart';

final appTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  primaryColor: Colors.deepPurple,

  // Define the default font family.
  fontFamily: 'Corben',
  primarySwatch: Colors.deepPurple,
  backgroundColor: Color(0xffeeeeee),

  // Define the default `TextTheme`. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.yellow, //  <-- light color
    textTheme: ButtonTextTheme.primary, //  <-- dark text for light background
  ),
);
