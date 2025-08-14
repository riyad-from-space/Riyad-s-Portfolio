import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionHeadline extends StatelessWidget {
  final IconData icon;
  final String sectionName;

  const SectionHeadline(
      {super.key, required this.icon, required this.sectionName});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isMobile = 1.sw < 600;
    final isTablet = 1.sw >= 600 && 1.sw < 1200;

    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
          size: isMobile
              ? 22.sp
              : isTablet
                  ? 24.sp
                  : 26.sp,
        ),
        SizedBox(width: isMobile ? 6.w : 8.w),
        Expanded(
          child: Text(
            sectionName,
            style: textTheme.headlineLarge?.copyWith(
              fontSize: isMobile
                  ? 20
                  : isTablet
                      ? 22
                      : 24,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        ),
      ],
    );
  }
}
