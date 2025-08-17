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
        borderRadius: BorderRadius.circular(10),
        border: Border(
          left: BorderSide(
            width: 5.w,
            color: primary,
          ),
          right: BorderSide(
            width: 0.2.w,
            color: primary,
          ),
          top: BorderSide(
            width: 0.2.w,
            color: primary,
          ),
          bottom: BorderSide(
            width: 0.2.w,
            color: primary,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        child: child,
      ),
    );
  }
}
