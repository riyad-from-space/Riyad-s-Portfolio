import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Application theme factory.
class AppTheme {
  AppTheme._();

  // ── Light ───────────────────────────────────────────────────────
  static ThemeData lightTheme(Color accent, String fontName) {
    final ts = _textStyles(fontName, accent, Brightness.light);
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBg,
      colorScheme: ColorScheme.light(
        primary: accent,
        surface: AppColors.lightSurface,
        onSurface: AppColors.lightText,
        outline: AppColors.lightBorder,
      ),
      fontFamily: fontName,
      textTheme: ts,
      dividerColor: AppColors.lightDivider,
      cardTheme: CardThemeData(
        color: AppColors.lightCardBg,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.lightBorder, width: 1),
        ),
      ),
      iconTheme: IconThemeData(color: accent, size: 22),
      chipTheme: ChipThemeData(
        backgroundColor: accent.withValues(alpha: 0.08),
        labelStyle: GoogleFonts.getFont(
          fontName,
          textStyle: TextStyle(
            fontSize: _pickSize(web: 12, tablet: 11, mobile: 10),
            fontWeight: FontWeight.w600,
            color: accent,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: accent.withValues(alpha: 0.2)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
    );
  }

  // ── Dark ────────────────────────────────────────────────────────
  static ThemeData darkTheme(Color accent, String fontName) {
    final ts = _textStyles(fontName, accent, Brightness.dark);
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBg,
      colorScheme: ColorScheme.dark(
        primary: accent,
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkText,
        outline: AppColors.darkBorder,
      ),
      fontFamily: fontName,
      textTheme: ts,
      dividerColor: AppColors.darkDivider,
      cardTheme: CardThemeData(
        color: AppColors.darkCardBg,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.darkBorder, width: 1),
        ),
      ),
      iconTheme: IconThemeData(color: accent, size: 22),
      chipTheme: ChipThemeData(
        backgroundColor: accent.withValues(alpha: 0.12),
        labelStyle: GoogleFonts.getFont(
          fontName,
          textStyle: TextStyle(
            fontSize: _pickSize(web: 12, tablet: 11, mobile: 10),
            fontWeight: FontWeight.w600,
            color: accent,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: accent.withValues(alpha: 0.3)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
    );
  }

  // ── Responsive size helper ──────────────────────────────────────
  static double _pickSize({
    required double web,
    required double tablet,
    required double mobile,
  }) {
    if (1.sw < 600) return mobile;
    if (1.sw < 1200) return tablet;
    return web;
  }

  // ── Shared text styles ──────────────────────────────────────────
  static TextTheme _textStyles(
    String font,
    Color accent,
    Brightness brightness,
  ) {
    final bool isDark = brightness == Brightness.dark;
    final Color heading = isDark ? AppColors.darkText : AppColors.lightText;
    final Color body = isDark ? AppColors.darkText : AppColors.lightText;
    final Color sub = isDark ? AppColors.darkSubtext : AppColors.lightSubtext;

    return TextTheme(
      // Hero name
      displayLarge: GoogleFonts.getFont(
        font,
        textStyle: TextStyle(
          fontSize: _pickSize(web: 48, tablet: 38, mobile: 30),
          fontWeight: FontWeight.w800,
          color: heading,
          letterSpacing: -1,
          height: 1.2,
        ),
      ),
      // Section heading
      headlineLarge: GoogleFonts.getFont(
        font,
        textStyle: TextStyle(
          fontSize: _pickSize(web: 28, tablet: 24, mobile: 20),
          fontWeight: FontWeight.w700,
          color: heading,
        ),
      ),
      // Card title
      headlineMedium: GoogleFonts.getFont(
        font,
        textStyle: TextStyle(
          fontSize: _pickSize(web: 18, tablet: 16, mobile: 15),
          fontWeight: FontWeight.w600,
          color: heading,
        ),
      ),
      // Subtitle / role
      headlineSmall: GoogleFonts.getFont(
        font,
        textStyle: TextStyle(
          fontSize: _pickSize(web: 22, tablet: 20, mobile: 17),
          fontWeight: FontWeight.w500,
          color: accent,
          letterSpacing: 0.5,
        ),
      ),
      // Body text
      bodyLarge: GoogleFonts.getFont(
        font,
        textStyle: TextStyle(
          fontSize: _pickSize(web: 16, tablet: 15, mobile: 14),
          fontWeight: FontWeight.w400,
          color: body,
          height: 1.7,
        ),
      ),
      // Secondary body
      bodyMedium: GoogleFonts.getFont(
        font,
        textStyle: TextStyle(
          fontSize: _pickSize(web: 14, tablet: 13, mobile: 12),
          fontWeight: FontWeight.w400,
          color: sub,
          height: 1.6,
        ),
      ),
      // Small label
      labelSmall: GoogleFonts.getFont(
        font,
        textStyle: TextStyle(
          fontSize: _pickSize(web: 12, tablet: 11, mobile: 10),
          fontWeight: FontWeight.w500,
          color: sub,
        ),
      ),
      // Navigation label
      labelMedium: GoogleFonts.getFont(
        font,
        textStyle: TextStyle(
          fontSize: _pickSize(web: 14, tablet: 13, mobile: 12),
          fontWeight: FontWeight.w600,
          color: heading,
        ),
      ),
    );
  }
}
