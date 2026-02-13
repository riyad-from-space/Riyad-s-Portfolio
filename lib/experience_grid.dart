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

    final List<Map<String, dynamic>> experiences = [
      {
        'title': 'Junior Software Engineer',
        'company': 'AppifyLab',
        'period': "May 2024 - Present",
        'bullets': [
          'Architected and delivered production-ready features using Flutter and Bloc pattern, serving 150000+ active users',
          'Integrated RESTful APIs with robust error handling and state management for seamless user experience',
          'Reduced app crashes by 40% through systematic debugging and performance optimization',
          'Successfully deployed and maintained applications on Google Play Store and Apple App Store',
          'Collaborated with cross-functional teams (designers, backend, QA) using Agile methodologies to ship features on time',
        ],
      },
      {
        'title': 'Software Engineering Intern',
        'company': 'AppifyLab',
        'period': "Feb 2024 - April 2024",
        'bullets': [
          'Built responsive UI components using Flutter widgets, achieving pixel-perfect designs across iOS and Android',
          'Mastered state management solutions (Provider, Riverpod) and implemented clean architecture principles',
          'Developed 3 complete mobile applications from ideation to production deployment',
          'Implemented Firebase Authentication, Firestore database, and Cloud Storage for real-time data synchronization',
          'Actively participated in code reviews, learning industry best practices and coding standards',
          'Contributed to team knowledge sharing through documentation and pair programming sessions',
        ],
      },
      {
        'title': 'Flutter Developer',
        'company': 'Heapiphy',
        'period': 'Part-Time (Remote)',
        'bullets': [
          'Delivered mobile solutions integrating REST APIs and third-party SDKs for enhanced functionality',
          'Improved user retention by 25% through iterative feature enhancements based on user feedback analysis',
          'Resolved critical UI/UX issues and optimized app performance, reducing load times by 30%',
          'Collaborated remotely with development team following Agile practices and sprint-based delivery',
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
