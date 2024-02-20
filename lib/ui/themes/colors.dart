
import 'package:flutter/cupertino.dart';

enum AppTheme {
  darkTheme,
  lightTheme,
}

class AppThemes {
  static final appThemeData = {
    AppTheme.darkTheme: const CupertinoThemeData(
      brightness: Brightness.dark,
      primaryColor: Color(0xFFE0E0E0),// Gris muy oscuro para el fondo
      scaffoldBackgroundColor: Color(0xFF212121), // Negro para el fondo del scaffold
      barBackgroundColor: Color(0xFF880E4F), // Burgundy para la barra
      textTheme: CupertinoTextThemeData(
        primaryColor: Color(0xFFE0E0E0), // Gris claro para texto principal
        textStyle: TextStyle(color: Color.fromARGB(241, 255, 179, 0)), // Naranja intenso para texto de acento
      ),
    ),
    AppTheme.lightTheme: const CupertinoThemeData(
      brightness: Brightness.light,
      primaryColor:Color(0xFF333333), // Gris muy claro para el fondo
      scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255), // Blanco para el fondo del scaffold
      barBackgroundColor: Color(0xFFC8B2C9), // Rosa palo para la barra
      textTheme: CupertinoTextThemeData(
        primaryColor: Color(0xFF333333), // Gris oscuro para texto principal
        textStyle: TextStyle(color: Color.fromARGB(227, 0, 0, 0)), // Negro para texto de acento
      ),
    ),
  };
}
