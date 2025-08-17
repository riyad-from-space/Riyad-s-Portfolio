import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguagesGrid extends StatelessWidget {
  final String fontFamily;
  const LanguagesGrid({super.key, required this.fontFamily});

  @override
  Widget build(BuildContext context) {
    final List<String> langs = ['English', 'Bangla'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: langs
          .map(
            (lang) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 28.w),
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
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
                child: Text(
                  lang,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
