import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riyad_portfolio/app_theme.dart';
import 'package:riyad_portfolio/portfolio_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  Color _selectedColor = Colors.red;
  String _selectedFont = 'Poppins';

  void _setThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  void _setColor(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }

  void _setFont(String font) {
    setState(() {
      _selectedFont = font;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080), // Desktop design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Riyad Portfolio',
          theme: AppTheme.lightTheme(_selectedColor, _selectedFont),
          darkTheme: AppTheme.darkTheme(_selectedColor, _selectedFont),
          themeMode: _themeMode,
          home: PortfolioScreen(
            themeMode: _themeMode,
            onThemeModeChanged: _setThemeMode,
            selectedColor: _selectedColor,
            onColorChanged: _setColor,
            selectedFont: _selectedFont,
            onFontChanged: _setFont,
          ),
        );
      },
    );
  }
}
