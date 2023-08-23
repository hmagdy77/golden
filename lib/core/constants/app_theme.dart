import 'package:flutter/material.dart';

import 'app_color_manger.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final light = ThemeData(
    tabBarTheme: TabBarTheme(
        overlayColor: MaterialStateProperty.all(Colors.grey),
        indicator: BoxDecoration(
            color: AppColorManger.primary,
            borderRadius: BorderRadius.circular(18))),
    primaryColor: AppColorManger.primary,
    primaryColorLight: AppColorManger.lightFontColor,
    primaryColorDark: AppColorManger.darkFontColor,
    secondaryHeaderColor: AppColorManger.grey,
    scaffoldBackgroundColor: AppColorManger.lightScaffold,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: AppColorManger.primary,
      centerTitle: true,
      titleTextStyle: GoogleFonts.cairo(
        // color: AppColorManger.lightFontColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.cairo(
          color: AppColorManger.lightFontColor,
          fontSize: 32,
          fontWeight: FontWeight.bold),
      titleMedium: GoogleFonts.cairo(
        color: AppColorManger.lightFontColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.cairo(
        color: AppColorManger.lightFontColor,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.cairo(
        color: AppColorManger.lightFontColor,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.cairo(
        color: AppColorManger.lightFontColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.cairo(
        color: AppColorManger.lightFontColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      displayLarge: GoogleFonts.cairo(
        color: AppColorManger.lightFontColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.cairo(
        color: AppColorManger.lightFontColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: GoogleFonts.cairo(
        color: AppColorManger.lightFontColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static final dark = ThemeData(
    primaryColor: AppColorManger.primary,
    primaryColorLight: AppColorManger.darkFontColor,
    primaryColorDark: AppColorManger.lightFontColor,
    secondaryHeaderColor: AppColorManger.backdark,
    scaffoldBackgroundColor: AppColorManger.darkScaffold,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: AppColorManger.primary,
      centerTitle: true,
      titleTextStyle: GoogleFonts.cairo(
        // color: AppColorManger.lightFontColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.cairo(
          color: AppColorManger.darkFontColor,
          fontSize: 32,
          fontWeight: FontWeight.bold),
      titleMedium: GoogleFonts.cairo(
        color: AppColorManger.darkFontColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.cairo(
        color: AppColorManger.darkFontColor,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.cairo(
        color: AppColorManger.darkFontColor,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.cairo(
        color: AppColorManger.darkFontColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.cairo(
        color: AppColorManger.darkFontColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      displayLarge: GoogleFonts.cairo(
        color: AppColorManger.darkFontColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.cairo(
        color: AppColorManger.darkFontColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: GoogleFonts.cairo(
        color: AppColorManger.lightFontColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
