import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme(Color selectedColor, String selectedFont) {
    // Determine device class using screen width
    final bool isMobile = 1.sw < 600;
    final bool isTablet = 1.sw >= 600 && 1.sw < 1200;

    double pickSize(
        {required double web, required double tablet, required double mobile}) {
      if (isMobile) return mobile;
      if (isTablet) return tablet;
      return web;
    }

    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: selectedColor,
        brightness: Brightness.light,
        primary: selectedColor,
      ),
      fontFamily: selectedFont,
      useMaterial3: true,
      brightness: Brightness.light,
      textTheme: TextTheme(
        headlineMedium: GoogleFonts.getFont(
          selectedFont,
          textStyle: TextStyle(
            fontSize: pickSize(web: 22, tablet: 20, mobile: 18),
            fontWeight: FontWeight.w600,
            color: selectedColor,
          ),
        ),
        bodyMedium: GoogleFonts.getFont(
          selectedFont,
          textStyle: TextStyle(
            fontSize: pickSize(web: 14, tablet: 13, mobile: 12),
            color: selectedColor,
          ),
        ),
        headlineLarge: GoogleFonts.getFont(
          selectedFont,
          textStyle: TextStyle(
            fontSize: pickSize(web: 28, tablet: 26, mobile: 24),
            fontWeight: FontWeight.bold,
            color: selectedColor,
          ),
        ),
        labelSmall: GoogleFonts.getFont(
          selectedFont,
          textStyle: TextStyle(
            fontSize: pickSize(web: 14, tablet: 13, mobile: 12),
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        displaySmall: GoogleFonts.getFont(
          selectedFont,
          textStyle: TextStyle(
            fontSize: pickSize(web: 16, tablet: 15, mobile: 14),
            fontWeight: FontWeight.w500,
            color: Colors.black,
            wordSpacing: 1.1,
          ),
        ),
      ),
    );
  }

  static ThemeData darkTheme(Color selectedColor, String selectedFont) {
    // Determine device class using screen width
    final bool isMobile = 1.sw < 600;
    final bool isTablet = 1.sw >= 600 && 1.sw < 1200;

    double pickSize(
        {required double web, required double tablet, required double mobile}) {
      if (isMobile) return mobile;
      if (isTablet) return tablet;
      return web;
    }

    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: selectedColor,
        brightness: Brightness.dark,
        primary: selectedColor,
      ),
      fontFamily: selectedFont,
      useMaterial3: true,
      brightness: Brightness.dark,
      textTheme: TextTheme(
        headlineMedium: GoogleFonts.getFont(
          selectedFont,
          textStyle: TextStyle(
            fontSize: pickSize(web: 22, tablet: 20, mobile: 18),
            fontWeight: FontWeight.w600,
            color: selectedColor,
          ),
        ),
        bodyMedium: GoogleFonts.getFont(
          selectedFont,
          textStyle: TextStyle(
            fontSize: pickSize(web: 14, tablet: 13, mobile: 12),
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        headlineLarge: GoogleFonts.getFont(
          selectedFont,
          textStyle: TextStyle(
            fontSize: pickSize(web: 28, tablet: 26, mobile: 24),
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        labelSmall: GoogleFonts.getFont(
          selectedFont,
          textStyle: TextStyle(
            fontSize: pickSize(web: 14, tablet: 13, mobile: 12),
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        displaySmall: GoogleFonts.getFont(
          selectedFont,
          textStyle: TextStyle(
            fontSize: pickSize(web: 16, tablet: 15, mobile: 14),
            fontWeight: FontWeight.w500,
            color: Colors.white,
            wordSpacing: 1.1,
          ),
        ),
      ),
    );
  }
}
