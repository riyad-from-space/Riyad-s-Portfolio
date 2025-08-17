import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgrammingLanguagesGrid extends StatelessWidget {
  final String fontFamily;
  const ProgrammingLanguagesGrid({super.key, required this.fontFamily});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final isMobile = 1.sw < 600;
    final isTablet = 1.sw >= 600 && 1.sw < 1200;
    final isWeb = 1.sw >= 1200;

    final List<Map<String, dynamic>> langs = [
      {
        'name': 'Dart',
        'icon': Icons.code,
        'color': Colors.blue,
        'description': 'Programming Language',
      },
      {
        'name': 'C',
        'icon': Icons.memory,
        'color': Colors.indigo,
        'description': 'Programming Language',
      },
      {
        'name': 'C++',
        'icon': Icons.developer_mode,
        'color': Colors.deepPurple,
        'description': 'Programming Language',
      },
      {
        'name': 'Java',
        'icon': Icons.coffee, // symbolic
        'color': Colors.orange,
        'description': 'Programming Language',
      },
      {
        'name': 'Python',
        'icon': Icons.pets, // symbolic
        'color': Colors.green,
        'description': 'Programming Language',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isWeb
            ? 6
            : isTablet
                ? 4
                : 3,
        childAspectRatio: isWeb
            ? 1.1
            : isTablet
                ? 1.2
                : 1.3,
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
      ),
      itemCount: langs.length,
      itemBuilder: (context, index) {
        final lang = langs[index];
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                lang['color'].withOpacity(0.1),
                lang['color'].withOpacity(0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: lang['color'].withOpacity(0.3),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: lang['color'].withOpacity(0.08),
                blurRadius: 6,
                offset: Offset(0, 1.5.h),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: lang['color'].withOpacity(0.18),
                  shape: BoxShape.circle,
                ),
                child: Icon(lang['icon'],
                    color: lang['color'], size: isWeb ? 32 : 24),
              ),
              SizedBox(height: 6.h),
              Text(
                lang['name'],
                style: theme.bodyMedium?.copyWith(
                  fontSize: isWeb ? 18 : 14,
                  fontWeight: FontWeight.w700,
                  color: lang['color'],
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}
