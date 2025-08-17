import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Utility extends StatelessWidget {
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final Color selectedColor;
  final ValueChanged<Color> onColorChanged;
  final String selectedFont;
  final ValueChanged<String> onFontChanged;

  const Utility({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
    required this.selectedColor,
    required this.onColorChanged,
    required this.selectedFont,
    required this.onFontChanged,
  });

  static const List<Map<String, dynamic>> _colorOptions =
      <Map<String, dynamic>>[
    {'color': Colors.red, 'name': 'Red'},
    {'color': Colors.blue, 'name': 'Blue'},
    {'color': Colors.green, 'name': 'Green'},
    {'color': Colors.purple, 'name': 'Purple'},
    {'color': Colors.orange, 'name': 'Orange'},
    {'color': Colors.teal, 'name': 'Teal'},
  ];

  static const List<String> _fontOptions = <String>[
    'Poppins',
    'Roboto',
    'Inter',
    'Lato',
    'Montserrat',
    'Open Sans',
  ];

  @override
  Widget build(BuildContext context) {
    final isTablet = 1.sw >= 600 && 1.sw < 1200;
    final bool isMobile = 1.sw < 600;

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8.w,
      runSpacing: 8.h,
      children: [
        // Theme mode toggle container
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
                Theme.of(context).colorScheme.primary.withOpacity(0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.brightness_6_outlined,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(width: 8.w),
              DropdownButton<ThemeMode>(
                value: themeMode,
                underline: Container(),
                icon: Container(),
                items: [
                  DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text('Light',
                          style: Theme.of(context).textTheme.displaySmall)),
                  DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text('Dark',
                          style: Theme.of(context).textTheme.displaySmall)),
                  DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Text('System',
                          style: Theme.of(context).textTheme.displaySmall)),
                ],
                onChanged: (mode) {
                  if (mode != null) onThemeModeChanged(mode);
                },
              ),
            ],
          ),
        ),

        // Color picker container
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
                Theme.of(context).colorScheme.primary.withOpacity(0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.color_lens_outlined,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(width: 8.w),
              DropdownButton<Map<String, dynamic>>(
                value: _colorOptions.firstWhere(
                  (option) => option['color'] == selectedColor,
                  orElse: () => _colorOptions.first,
                ),
                underline: Container(),
                icon: Container(),
                items: _colorOptions
                    .map((c) => DropdownMenuItem(
                          value: c,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                c['name'] as String,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ],
                          ),
                        ))
                    .toList(),
                onChanged: (colorOption) {
                  if (colorOption != null)
                    onColorChanged(colorOption['color'] as Color);
                },
              ),
            ],
          ),
        ),

        // Font picker container
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
                Theme.of(context).colorScheme.primary.withOpacity(0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.font_download_outlined,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(width: 8.w),
              DropdownButton<String>(
                value: _fontOptions.contains(selectedFont)
                    ? selectedFont
                    : _fontOptions.first,
                underline: Container(),
                icon: Container(),
                items: _fontOptions
                    .map((f) => DropdownMenuItem(
                          value: f,
                          child: Text(f,
                              style: Theme.of(context).textTheme.displaySmall),
                        ))
                    .toList(),
                onChanged: (font) {
                  if (font != null) onFontChanged(font);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
