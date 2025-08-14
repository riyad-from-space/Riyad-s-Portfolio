import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_container.dart';

class Experience {
  final String title;
  final String company;
  final String duration;
  final List<String> responsibilities;

  Experience({
    required this.title,
    required this.company,
    required this.duration,
    required this.responsibilities,
  });
}

class ExperienceListView extends StatelessWidget {
  final String fontFamily;
  const ExperienceListView({super.key, required this.fontFamily});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final isMobile = 1.sw < 600;
    final isTablet = 1.sw >= 600 && 1.sw < 1200;

    final List<Map<String, dynamic>> experiences = [
      {
        'title': 'Senior Flutter Developer',
        'company': 'Tech Corp',
        'period': '2022 - Present',
        'bullets': [
          'Led development of cross-platform features with Flutter.',
          'Improved app performance and reduced build times by 25%.',
          'Collaborated with designers and backend teams to ship features.',
        ],
      },
      {
        'title': 'Mobile Developer',
        'company': 'Appify Lab',
        'period': '2020 - 2022',
        'bullets': [
          'Built and maintained client apps with Flutter and Firebase.',
          'Implemented CI/CD pipelines for faster releases.',
        ],
      },
      {
        'title': 'Junior Developer',
        'company': 'Startup Inc.',
        'period': '2018 - 2020',
        'bullets': [
          'Contributed to UI components and bug fixes.',
          'Wrote unit tests and documentation.',
        ],
      },
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
        childAspectRatio: isMobile
            ? 1.6
            : isTablet
                ? 2.0
                : 2.6,
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
      itemCount: experiences.length,
      itemBuilder: (context, index) {
        final exp = experiences[index];
        return CustomContainer(
          child: Padding(
            padding: EdgeInsets.all(isMobile
                ? 12.w
                : isTablet
                    ? 14.w
                    : 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  exp['title']!,
                  style: theme.headlineMedium?.copyWith(
                    fontSize: isMobile
                        ? 16
                        : isTablet
                            ? 18
                            : 20,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                    height: isMobile
                        ? 6.h
                        : isTablet
                            ? 8.h
                            : 10.h),
                Text(
                  exp['company']!,
                  style: theme.bodyMedium?.copyWith(
                    fontSize: isMobile
                        ? 14
                        : isTablet
                            ? 15
                            : 16,
                    color: Theme.of(context).colorScheme.primary,
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
                  exp['period']!,
                  style: theme.labelSmall?.copyWith(
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
                ),
                SizedBox(height: isMobile ? 6.h : 8.h),
                ...((exp['bullets'] as List<String>).take(isMobile ? 2 : 3).map(
                      (b) => Padding(
                        padding: EdgeInsets.only(bottom: isMobile ? 4.h : 6.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ', style: theme.labelSmall),
                            Expanded(
                              child: Text(
                                b,
                                style: theme.displaySmall,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
