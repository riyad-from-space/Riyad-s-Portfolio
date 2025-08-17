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
        'title': 'Junior Software Engineer ',
        'company': 'AppifyLab',
        'period': "May'24 - Present",
        'bullets': [
          'Worked on Push Notification system for enhanced user engagement',
          'Built real-time Chat functionality with Firebase integration',
          'Performed continuous bug fixing and feature improvements for app stability',
          'Integrated RESTful APIs for seamless backend communication',
          'Managed app deployment on both Google Play Store and Apple App Store',
          'Collaborated with designers and backend teams to ship features.',
        ],
      },
      {
        'title': 'Intern Software Engineer',
        'company': 'AppifyLab',
        'period': "Feb'24 - April'24",
        'bullets': [
          'Implemented feature UI components using Flutter widgets and Material Design',
          'Learned and applied various APIs and State Management solutions (Provider, Riverpod)',
          'Developed complete mobile applications from concept to deployment',
          'Worked with Firebase services for authentication and data management',
          'Participated in code reviews and learned best practices from senior developers',
          'Gained hands-on experience with Git version control and collaborative development',
        ],
      },
      {
        'title': 'Flutter Developer',
        'company': 'Heapiphy',
        'period': 'Part-Time',
        'bullets': [
          'Developed mobile applications using REST APIs and third-party services',
          'Implemented feature improvements and enhancements based on user feedback',
          'Contributed to UI components and bug fixes for better user experience',
          'Collaborated with development team on agile development practices',
        ],
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: experiences.length,
      itemBuilder: (context, index) {
        final exp = experiences[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: CustomContainer(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    exp['title']!,
                    style: theme.headlineMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    exp['company']!,
                    style: theme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    exp['period']!,
                    style: theme.labelSmall,
                  ),
                  SizedBox(height: 12.h),
                  ...((exp['bullets'] as List<String>).map(
                    (b) => Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• ', style: theme.labelSmall),
                          Expanded(
                            child: Text(
                              b,
                              style: theme.displaySmall,
                              maxLines: 3,
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
          ),
        );
      },
    );
  }
}
