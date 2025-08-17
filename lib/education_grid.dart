import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_container.dart';

class EducationGrid extends StatelessWidget {
  final String fontFamily;
  const EducationGrid({super.key, required this.fontFamily});

  @override
  Widget build(BuildContext context) {
    final isMobile = 1.sw < 600;
    final isTablet = 1.sw >= 600 && 1.sw < 1200;

    const items = [
      {
        'degree': 'B.Sc. in CSE',
        'institute': 'Leading Univercity, Sylhet',
        'duration': 'Jan 2022 — Present',
        'cgpa': '3.1'
      },
      // {
      //   'degree': 'M.Sc. in SE',
      //   'institute': 'Your University Name',
      //   'duration': 'Planned',
      //   'cgpa': '-'
      // },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile
            ? 1
            : isTablet
                ? 2
                : 2,
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
            ? 3.5
            : isTablet
                ? 3.8
                : 4,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return CustomContainer(
          child: Padding(
            padding: EdgeInsets.all(isMobile
                ? 10.w
                : isTablet
                    ? 12.w
                    : 14.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.school_outlined,
                  size: 24,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(width: isMobile ? 8.w : 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item['degree'] as String,
                        style: Theme.of(context).textTheme.headlineMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: isMobile ? 4.h : 6.h),
                      Text(
                        item['institute'] as String,
                        style: Theme.of(context).textTheme.displaySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: isMobile ? 4.h : 6.h),
                      Row(
                        children: [
                          Icon(Icons.calendar_today_outlined,
                              size: 16,
                              color: Theme.of(context).colorScheme.primary),
                          SizedBox(width: 6.w),
                          Text(
                            item['duration'] as String,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          SizedBox(width: 12.w),
                          Icon(Icons.grade_outlined,
                              size: 16,
                              color: Theme.of(context).colorScheme.primary),
                          SizedBox(width: 6.w),
                          Text(
                            'CGPA: ${item['cgpa']}',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
