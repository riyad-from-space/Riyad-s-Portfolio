import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riyad_portfolio/custom_container.dart';
import 'package:riyad_portfolio/experience_grid.dart';
import 'package:riyad_portfolio/qualifications_grid.dart';
import 'package:riyad_portfolio/section_headline.dart';
import 'package:riyad_portfolio/technical_skills.dart';
import 'package:riyad_portfolio/title_header.dart';
import 'package:riyad_portfolio/utility.dart';

import 'education_grid.dart';
import 'languages_grid.dart';
import 'programming_languages_grid.dart';
import 'projects_grid.dart';

class PortfolioScreen extends StatefulWidget {
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final Color selectedColor;
  final ValueChanged<Color> onColorChanged;
  final String selectedFont;
  final ValueChanged<String> onFontChanged;

  const PortfolioScreen({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
    required this.selectedColor,
    required this.onColorChanged,
    required this.selectedFont,
    required this.onFontChanged,
  });

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    // Responsive breakpoints
    final isMobile = 1.sw < 600;
    final isTablet = 1.sw >= 600 && 1.sw < 1200;
    final isDesktop = 1.sw >= 1200;

    // Responsive padding and spacing
    final horizontalPadding = isMobile
        ? 20.w
        : isTablet
            ? 60.w
            : 200.w;
    final topPadding = isMobile
        ? 20.h
        : isTablet
            ? 30.h
            : 50.h;
    final sectionSpacing = isMobile
        ? 20.h
        : isTablet
            ? 30.h
            : 40.h;
    final smallSpacing = isMobile
        ? 10.h
        : isTablet
            ? 15.h
            : 20.h;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: topPadding,
            left: horizontalPadding,
            right: horizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Utility(
                  themeMode: widget.themeMode,
                  onThemeModeChanged: widget.onThemeModeChanged,
                  selectedColor: widget.selectedColor,
                  onColorChanged: widget.onColorChanged,
                  selectedFont: widget.selectedFont,
                  onFontChanged: widget.onFontChanged,
                ),
              ),
              SizedBox(height: sectionSpacing),
              TitleHeader(fontFamily: widget.selectedFont),
              SizedBox(height: sectionSpacing),
              const SectionHeadline(
                icon: Icons.info_outline,
                sectionName: "Professional Summary",
              ),
              SizedBox(height: smallSpacing),
              CustomContainer(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(isMobile ? 15.w : 20.w),
                  child: Text(
                    "I am a dedicated and detail-oriented professional with a strong background in mobile app development and a passion for building high-quality, user-focused digital solutions. With hands-on experience in designing, developing, and deploying scalable applications, I specialize in turning complex requirements into clean, efficient, and maintainable code. I thrive in collaborative environments, continuously seek to learn new technologies, and aim to deliver impactful results that align with user needs and business goals.",
                    style: theme.displaySmall,
                  ),
                ),
              ),
              SizedBox(height: sectionSpacing),
              const SectionHeadline(
                icon: Icons.check_circle_outline,
                sectionName: "Key Qualifications",
              ),
              SizedBox(height: smallSpacing),
              QualificationsGrid(fontFamily: widget.selectedFont),
              SizedBox(height: smallSpacing),
              const SectionHeadline(
                icon: Icons.settings,
                sectionName: "Technical Skills",
              ),
              SizedBox(height: smallSpacing),
              TechnicalSkillsGrid(fontFamily: widget.selectedFont),
              SizedBox(height: smallSpacing),
              const SectionHeadline(
                icon: Icons.extension,
                sectionName: "Professional Experience",
              ),
              SizedBox(height: smallSpacing),
              ExperienceListView(fontFamily: widget.selectedFont),
              SizedBox(height: smallSpacing),
              const SectionHeadline(
                icon: Icons.language,
                sectionName: "Languages",
              ),
              SizedBox(height: smallSpacing),
              LanguagesGrid(fontFamily: widget.selectedFont),
              SizedBox(height: smallSpacing),
              const SectionHeadline(
                icon: Icons.code,
                sectionName: "Programming Languages",
              ),
              SizedBox(height: smallSpacing),
              ProgrammingLanguagesGrid(fontFamily: widget.selectedFont),
              SizedBox(height: sectionSpacing),
              const SectionHeadline(
                icon: Icons.folder_special,
                sectionName: "Projects",
              ),
              SizedBox(height: smallSpacing),
              ProjectsGrid(fontFamily: widget.selectedFont),
              SizedBox(height: sectionSpacing),
              const SectionHeadline(
                icon: Icons.school,
                sectionName: "Education",
              ),
              SizedBox(height: smallSpacing),
              EducationGrid(fontFamily: widget.selectedFont),
              SizedBox(height: sectionSpacing),
            ],
          ),
        ),
      ),
    );
  }
}
