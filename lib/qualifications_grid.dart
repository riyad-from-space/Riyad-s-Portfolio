import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_container.dart';

class QualificationsGrid extends StatelessWidget {
  final String fontFamily;
  const QualificationsGrid({super.key, required this.fontFamily});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final isMobile = 1.sw < 600;
    final isTablet = 1.sw >= 600 && 1.sw < 1200;

    const items = [
      ['Flutter', 'UI toolkit for building native apps'],
      ['Cross-Platform', 'Single codebase for all devices'],
      ['Firebase', 'Backend services by Google'],
      ['Supabase', 'Open-source Firebase alternative'],
      ['CI/CD', 'Automated build and deploy'],
      ['Testing', 'Unit and widget tests'],
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile
            ? 2
            : isTablet
                ? 2
                : 3,
        childAspectRatio: isMobile
            ? 2.6
            : isTablet
                ? 3.0
                : 3.4,
        crossAxisSpacing: isMobile
            ? 12.w
            : isTablet
                ? 16.w
                : 20.w,
        mainAxisSpacing: isMobile
            ? 12.h
            : isTablet
                ? 16.h
                : 20.h,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
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
                  style: theme.headlineMedium,
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
                  style: theme.displaySmall,
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
