import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;

  const CustomContainer({super.key, this.height, this.width, this.child});

  @override
  Widget build(BuildContext context) {
    final Color primary = Theme.of(context).colorScheme.primary;
    final isMobile = 1.sw < 600;
    final isTablet = 1.sw >= 600 && 1.sw < 1200;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isMobile
            ? 8.r
            : isTablet
                ? 10.r
                : 12.r),
        border: Border(
          left: BorderSide(
            width: isMobile
                ? 4.w
                : isTablet
                    ? 5.w
                    : 6.w,
            color: primary,
          ),
          right: BorderSide(
            width: isMobile
                ? 0.1.w
                : isTablet
                    ? 0.15.w
                    : 0.2.w,
            color: primary,
          ),
          top: BorderSide(
            width: isMobile
                ? 0.1.w
                : isTablet
                    ? 0.15.w
                    : 0.2.w,
            color: primary,
          ),
          bottom: BorderSide(
            width: isMobile
                ? 0.1.w
                : isTablet
                    ? 0.15.w
                    : 0.2.w,
            color: primary,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile
              ? 4.w
              : isTablet
                  ? 5.w
                  : 6.w,
        ),
        child: child,
      ),
    );
  }
}
