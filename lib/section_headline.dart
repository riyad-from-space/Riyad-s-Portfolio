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
          size: 26,
        ),
        SizedBox(width: isMobile ? 6.w : 8.w),
        Expanded(
          child: Text(
            sectionName,
            style: textTheme.headlineLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        ),
      ],
    );
  }
}
