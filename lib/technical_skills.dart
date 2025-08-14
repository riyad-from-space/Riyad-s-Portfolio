import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_container.dart';

class TechnicalSkillsGrid extends StatelessWidget {
  final String fontFamily;
  const TechnicalSkillsGrid({super.key, required this.fontFamily});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final isMobile = 1.sw < 600;
    final isTablet = 1.sw >= 600 && 1.sw < 1200;

    const skills = [
      ['Flutter', 'Declarative UI framework'],
      ['Dart', 'AOT/JIT compiled language'],
      ['Firebase', 'Auth, DB, Storage, FCM'],
      ['SQLite', 'Local persistence'],
      ['Bloc', 'Predictable state management'],
      ['Provider', 'Simple state mgmt'],
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile
            ? 2
            : isTablet
                ? 3
                : 3,
        childAspectRatio: isMobile
            ? 2.8
            : isTablet
                ? 3.2
                : 3.6,
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
      itemCount: skills.length,
      itemBuilder: (context, index) {
        final item = skills[index];
        return CustomContainer(
          child: Padding(
            padding: EdgeInsets.all(isMobile
                ? 8.w
                : isTablet
                    ? 9.w
                    : 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item[0],
                  style: theme.headlineMedium?.copyWith(
                    fontSize: isMobile
                        ? 14
                        : isTablet
                            ? 16
                            : 18,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                    height: isMobile
                        ? 4.h
                        : isTablet
                            ? 5.h
                            : 6.h),
                Text(
                  item[1],
                  style: theme.displaySmall?.copyWith(
                    fontSize: isMobile
                        ? 11
                        : isTablet
                            ? 12
                            : 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
