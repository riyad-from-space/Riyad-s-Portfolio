import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguagesGrid extends StatelessWidget {
  final String fontFamily;
  const LanguagesGrid({super.key, required this.fontFamily});

  @override
  Widget build(BuildContext context) {
    final isMobile = 1.sw < 600;
    final isTablet = 1.sw >= 600 && 1.sw < 1200;

    const langs = ['English', 'Bengali'];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile
            ? 2
            : isTablet
                ? 3
                : 4,
        childAspectRatio: isMobile
            ? 2.8
            : isTablet
                ? 3.2
                : 3.5,
        crossAxisSpacing: isMobile
            ? 8.w
            : isTablet
                ? 10.w
                : 12.w,
        mainAxisSpacing: isMobile
            ? 8.h
            : isTablet
                ? 10.h
                : 12.h,
      ),
      itemCount: langs.length,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(isMobile
                ? 6.r
                : isTablet
                    ? 7.r
                    : 8.r),
          ),
          child: Text(
            langs[index],
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: isMobile
                      ? 12
                      : isTablet
                          ? 13
                          : 14,
                ),
          ),
        );
      },
    );
  }
}
