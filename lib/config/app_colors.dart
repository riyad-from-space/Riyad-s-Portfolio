import 'package:flutter/material.dart';

/// Centralized color palette for the portfolio.
/// Default: Black & White with Teal accent.
class AppColors {
  AppColors._();

  // ── Eye-catchy accent options (no red) ──────────────────────────
  static const List<AccentOption> accentOptions = [
    AccentOption(name: 'Teal', color: Color(0xFF00BFA6)),
    AccentOption(name: 'Cyan', color: Color(0xFF00B8D4)),
    AccentOption(name: 'Indigo', color: Color(0xFF536DFE)),
    AccentOption(name: 'Violet', color: Color(0xFF7C4DFF)),
    AccentOption(name: 'Amber', color: Color(0xFFFFAB00)),
    AccentOption(name: 'Coral', color: Color(0xFFFF6D00)),
    AccentOption(name: 'Emerald', color: Color(0xFF00C853)),
    AccentOption(name: 'Rose', color: Color(0xFFFF4081)),
  ];

  // ── Light theme palette ─────────────────────────────────────────
  static const Color lightBg = Color(0xFFF8F9FA);
  static const Color lightSurface = Colors.white;
  static const Color lightCardBg = Colors.white;
  static const Color lightText = Color(0xFF1A1A2E);
  static const Color lightSubtext = Color(0xFF6B7280);
  static const Color lightBorder = Color(0xFFE5E7EB);
  static const Color lightDivider = Color(0xFFE5E7EB);

  // ── Dark theme palette ──────────────────────────────────────────
  static const Color darkBg = Color(0xFF0F0F1A);
  static const Color darkSurface = Color(0xFF1A1A2E);
  static const Color darkCardBg = Color(0xFF16213E);
  static const Color darkText = Color(0xFFF1F5F9);
  static const Color darkSubtext = Color(0xFF9CA3AF);
  static const Color darkBorder = Color(0xFF2D2D44);
  static const Color darkDivider = Color(0xFF2D2D44);

  // ── Shared ──────────────────────────────────────────────────────
  static const Color navBarLight = Color(0xFFFAFAFA);
  static const Color navBarDark = Color(0xFF121225);
}

/// Represents a selectable accent color.
class AccentOption {
  final String name;
  final Color color;
  const AccentOption({required this.name, required this.color});
}
