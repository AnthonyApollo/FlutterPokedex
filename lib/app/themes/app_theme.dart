import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
        color: Colors.white),
    headline1: GoogleFonts.openSans(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.white),
    headline2: GoogleFonts.openSans(
        fontSize: 21.0,
        fontWeight: FontWeight.w700,
        color: Colors.white),
    headline3: GoogleFonts.openSans(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: Colors.white),
    headline6: GoogleFonts.openSans(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.white),
    subtitle1: GoogleFonts.openSans(
        fontSize: 21.0,
        fontWeight: FontWeight.bold,
        color: Colors.grey[500]),
  );

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.grey[900],
      accentColor: Colors.red[600],
      textTheme: darkTextTheme,
    );
  }
}