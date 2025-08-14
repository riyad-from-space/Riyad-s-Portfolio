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

  static const List<Color> _colorOptions = <Color>[
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.teal,
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
    final isMobile = 1.sw < 600;
    final isTablet = 1.sw >= 600 && 1.sw < 1200;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Theme mode toggle container
        Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          child: Padding(
            padding: EdgeInsets.all(isMobile
                ? 8.w
                : isTablet
                    ? 10.w
                    : 12.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.brightness_6_outlined,
                    size: isMobile ? 18.sp : 20.sp),
                SizedBox(width: isMobile ? 6.w : 8.w),
                DropdownButton<ThemeMode>(
                  value: themeMode,
                  items: const [
                    DropdownMenuItem(
                        value: ThemeMode.light, child: Text('Light')),
                    DropdownMenuItem(
                        value: ThemeMode.dark, child: Text('Dark')),
                    DropdownMenuItem(
                        value: ThemeMode.system, child: Text('System')),
                  ],
                  onChanged: (mode) {
                    if (mode != null) onThemeModeChanged(mode);
                  },
                ),
              ],
            ),
          ),
        ),

        SizedBox(
            width: isMobile
                ? 12.w
                : isTablet
                    ? 16.w
                    : 20.w),

        // Color picker container
        Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          child: Padding(
            padding: EdgeInsets.all(isMobile
                ? 8.w
                : isTablet
                    ? 10.w
                    : 12.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.color_lens_outlined, size: isMobile ? 18.sp : 20.sp),
                SizedBox(width: isMobile ? 6.w : 8.w),
                DropdownButton<Color>(
                  value: _colorOptions.contains(selectedColor)
                      ? selectedColor
                      : _colorOptions.first,
                  items: _colorOptions
                      .map((c) => DropdownMenuItem(
                            value: c,
                            child: Row(
                              children: [
                                Container(
                                  width: isMobile ? 14.w : 16.w,
                                  height: isMobile ? 14.h : 16.h,
                                  decoration: BoxDecoration(
                                      color: c, shape: BoxShape.circle),
                                ),
                                SizedBox(width: isMobile ? 6.w : 8.w),
                                Text(
                                    '#${c.value.toRadixString(16).padLeft(8, '0').toUpperCase()}'),
                              ],
                            ),
                          ))
                      .toList(),
                  onChanged: (color) {
                    if (color != null) onColorChanged(color);
                  },
                ),
              ],
            ),
          ),
        ),

        SizedBox(
            width: isMobile
                ? 12.w
                : isTablet
                    ? 16.w
                    : 20.w),

        // Font picker container
        Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          child: Padding(
            padding: EdgeInsets.all(isMobile
                ? 8.w
                : isTablet
                    ? 10.w
                    : 12.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.font_download_outlined,
                    size: isMobile ? 18.sp : 20.sp),
                SizedBox(width: isMobile ? 6.w : 8.w),
                DropdownButton<String>(
                  value: _fontOptions.contains(selectedFont)
                      ? selectedFont
                      : _fontOptions.first,
                  items: _fontOptions
                      .map((f) => DropdownMenuItem(
                            value: f,
                            child: Text(f),
                          ))
                      .toList(),
                  onChanged: (font) {
                    if (font != null) onFontChanged(font);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
