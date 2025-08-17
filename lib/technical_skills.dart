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
      [
        'Flutter',
        'Provider, Riverpod, GetX, Clean Architecture, MVVM, Push Notifications'
      ],
      ['Database', 'Firebase, Supabase, MySQL'],
      ['Operating Systems', 'Windows, Linux, MacOS'],
      ['Version Control', 'Git, Github, Gitlab'],
      ['Development Tools', 'VS Code, Android Studio, Xcode'],
      ['Development & CI/CD', 'Playstore, Appstore'],
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile
            ? 1
            : isTablet
                ? 2
                : 3,
        childAspectRatio: 3,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.w,
      ),
      itemCount: skills.length,
      itemBuilder: (context, index) {
        final item = skills[index];
        return CustomContainer(
          child: Padding(
            padding: EdgeInsets.all(8.w),
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
                SizedBox(height: 5.h),
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
