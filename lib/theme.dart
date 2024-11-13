import "package:flutter/material.dart";

var appTheme = ThemeData(
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.black87,
  ),
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 18),
    bodyMedium: TextStyle(fontSize: 16),
    labelLarge: TextStyle(
      // Updated from button
      letterSpacing: 1.5,
      fontWeight: FontWeight.bold,
    ),
    displayLarge: TextStyle(
      // Updated from headline1
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      // Updated from subtitle1
      color: Colors.grey,
    ),
  ),
  buttonTheme: const ButtonThemeData(),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    color: Colors.grey[900], // Background color
    titleTextStyle: const TextStyle(
      fontSize: 20,
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.white), // Icon color
  ),
);
