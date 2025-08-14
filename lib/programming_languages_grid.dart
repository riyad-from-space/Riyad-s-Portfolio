import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgrammingLanguagesGrid extends StatelessWidget {
  final String fontFamily;
  const ProgrammingLanguagesGrid({super.key, required this.fontFamily});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final isMobile = 1.sw < 600;
    final isTablet = 1.sw >= 600 && 1.sw < 1200;

    final List<Map<String, dynamic>> langs = [
      {
        'name': 'Dart',
        'icon': Icons.code,
        'color': Colors.blue,
        'description': 'Flutter SDK',
      },
      {
        'name': 'Kotlin',
        'icon': Icons.android,
        'color': Colors.orange,
        'description': 'Android Dev',
      },
      {
        'name': 'Swift',
        'icon': Icons.phone_iphone,
        'color': Colors.red,
        'description': 'iOS Dev',
      },
      {
        'name': 'JavaScript',
        'icon': Icons.web,
        'color': Colors.yellow,
        'description': 'Web Dev',
      },
    ];

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
            ? 1.5
            : isTablet
                ? 1.8
                : 2.2,
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
        final lang = langs[index];
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                lang['color'].withOpacity(0.1),
                lang['color'].withOpacity(0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(isMobile
                ? 12.r
                : isTablet
                    ? 14.r
                    : 16.r),
            border: Border.all(
              color: lang['color'].withOpacity(0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: lang['color'].withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(isMobile
                ? 12.w
                : isTablet
                    ? 14.w
                    : 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(isMobile
                      ? 8.w
                      : isTablet
                          ? 10.w
                          : 12.w),
                  decoration: BoxDecoration(
                    color: lang['color'].withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    lang['icon'],
                    color: lang['color'],
                    size: isMobile
                        ? 24.sp
                        : isTablet
                            ? 28.sp
                            : 32.sp,
                  ),
                ),
                SizedBox(
                    height: isMobile
                        ? 8.h
                        : isTablet
                            ? 10.h
                            : 12.h),
                Text(
                  lang['name'],
                  style: theme.headlineMedium?.copyWith(
                    fontSize: isMobile
                        ? 16
                        : isTablet
                            ? 18
                            : 20,
                    fontWeight: FontWeight.w600,
                    color: lang['color'],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                    height: isMobile
                        ? 4.h
                        : isTablet
                            ? 5.h
                            : 6.h),
                Text(
                  lang['description'],
                  style: theme.bodyMedium?.copyWith(
                    fontSize: isMobile
                        ? 12
                        : isTablet
                            ? 13
                            : 14,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
