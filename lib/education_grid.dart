import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EducationGrid extends StatelessWidget {
  final String fontFamily;
  const EducationGrid({super.key, required this.fontFamily});

  @override
  Widget build(BuildContext context) {
    final isMobile = 1.sw < 600;
    final isTablet = 1.sw >= 600 && 1.sw < 1200;

    const items = ['B.Sc. in CSE', 'M.Sc. in SE'];

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
        return ListTile(
          leading: Icon(
            Icons.school_outlined,
            size: isMobile
                ? 20.sp
                : isTablet
                    ? 22.sp
                    : 24.sp,
          ),
          title: Text(
            items[index],
            style: TextStyle(
              fontSize: isMobile
                  ? 14
                  : isTablet
                      ? 15
                      : 16,
            ),
          ),
        );
      },
    );
  }
}
