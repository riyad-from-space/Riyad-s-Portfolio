import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_container.dart';

class ProjectsGrid extends StatelessWidget {
  final String fontFamily;
  const ProjectsGrid({super.key, required this.fontFamily});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final isMobile = 1.sw < 600;
    final isTablet = 1.sw >= 600 && 1.sw < 1200;

    const projects = [
      'Portfolio Website (Flutter)',
      'E-commerce App (Flutter)',
      'Chat App (Flutter)',
      'Task Manager (Java)',
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
        childAspectRatio: isMobile
            ? 2.2
            : isTablet
                ? 2.5
                : 2.8,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return CustomContainer(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(isMobile
                  ? 6.w
                  : isTablet
                      ? 7.w
                      : 8.w),
              child: Text(
                projects[index],
                style: theme.bodyMedium?.copyWith(
                  fontSize: isMobile
                      ? 12
                      : isTablet
                          ? 13
                          : 14,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }
}
