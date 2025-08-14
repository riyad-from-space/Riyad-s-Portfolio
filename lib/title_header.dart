import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

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
              _contactChip(
                'LinkedIn',
                Icons.link,
                'https://www.linkedin.com/in/riyadfromspace/',
                textTheme,
                primary,
                isMobile,
                isTablet,
              ),
              _contactChip(
                'GitHub',
                Icons.code,
                'https://github.com/riyad-from-space',
                textTheme,
                primary,
                isMobile,
                isTablet,
              ),
              _contactChip(
                'ahmedriyad10186@gmail.com',
                Icons.email,
                'mailto:ahmedriyad10186@gmail.com',
                textTheme,
                primary,
                isMobile,
                isTablet,
              ),
              _contactChip(
                '01799771074',
                Icons.phone,
                'tel:01799771074',
                textTheme,
                primary,
                isMobile,
                isTablet,
              ),
              _contactChip(
                'Sylhet, Bangladesh',
                Icons.location_city,
                'https://www.google.com/maps/search/?api=1&query=Sylhet%2C%20Bangladesh',
                textTheme,
                primary,
                isMobile,
                isTablet,
              ),
              _contactChip(
                'Resume',
                Icons.picture_as_pdf,
                'https://riyad-portfolio-f18db.web.app',
                textTheme,
                primary,
                isMobile,
                isTablet,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _contactChip(
    String text,
    IconData icon,
    String href,
    TextTheme textTheme,
    Color iconColor,
    bool isMobile,
    bool isTablet,
  ) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(href);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.platformDefault);
        }
      },
      borderRadius: BorderRadius.circular(6.r),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 6.w : 8.w,
          vertical: isMobile ? 4.h : 5.h,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: iconColor,
            ),
            SizedBox(width: isMobile ? 4.w : 5.w),
            Text(text, style: textTheme.labelSmall),
          ],
        ),
      ),
    );
  }
}
