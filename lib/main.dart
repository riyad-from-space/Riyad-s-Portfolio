import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/app_colors.dart';
import 'config/app_theme.dart';
import 'screens/portfolio_screen.dart';

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
  // Default: Teal (no red!)
  Color _selectedColor = AppColors.accentOptions.first.color;
  final String _selectedFont = 'Poppins';

  void _setThemeMode(ThemeMode mode) => setState(() => _themeMode = mode);
  void _setColor(Color color) => setState(() => _selectedColor = color);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
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
          ),
        );
      },
    );
  }
}
