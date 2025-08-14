import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleHeader extends StatelessWidget {
  final String fontFamily;

  const TitleHeader({super.key, this.fontFamily = 'Poppins'});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final Color primary = Theme.of(context).colorScheme.primary;

    final isMobile = 1.sw < 600;
    final isTablet = 1.sw >= 600 && 1.sw < 1200;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Riyad Ahmed Sagor',
          style: textTheme.headlineLarge?.copyWith(
            color: Colors.black,
            fontSize: isMobile
                ? 24
                : isTablet
                    ? 26
                    : 28,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: isMobile ? 8.h : 10.h),
        Text(
          'Software Engineer (Flutter)',
          style: textTheme.headlineMedium?.copyWith(
            fontSize: isMobile
                ? 16
                : isTablet
                    ? 17
                    : 18,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: isMobile ? 16.h : 20.h),
        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: isMobile
                ? 16.w
                : isTablet
                    ? 18.w
                    : 20.w,
            runSpacing: isMobile
                ? 8.h
                : isTablet
                    ? 9.h
                    : 10.h,
            children: [
              _contactChip('linkedin', Icons.link, textTheme, primary, isMobile,
                  isTablet),
              _contactChip('ahmedriyad10186@gmail.com', Icons.email, textTheme,
                  primary, isMobile, isTablet),
              _contactChip('01799771074', Icons.phone, textTheme, primary,
                  isMobile, isTablet),
              _contactChip('Sylhet,Bangladesh', Icons.location_city, textTheme,
                  primary, isMobile, isTablet),
              _contactChip('Resume', Icons.picture_as_pdf, textTheme, primary,
                  isMobile, isTablet),
            ],
          ),
        ),
      ],
    );
  }

  Widget _contactChip(
    String text,
    IconData icon,
    TextTheme textTheme,
    Color iconColor,
    bool isMobile,
    bool isTablet,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: isMobile
              ? 18.sp
              : isTablet
                  ? 19.sp
                  : 20.sp,
          color: iconColor,
        ),
        SizedBox(width: isMobile ? 4.w : 5.w),
        Text(text, style: textTheme.labelSmall),
      ],
    );
  }
}
