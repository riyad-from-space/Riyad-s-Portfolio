import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../widgets/about_section.dart';
import '../widgets/education_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/footer.dart';
import '../widgets/hero_section.dart';
import '../widgets/nav_bar.dart';
import '../widgets/projects_section.dart';
import '../widgets/section_divider.dart';
import '../widgets/section_headline.dart';
import '../widgets/skills_section.dart';

/// Main portfolio screen with sticky nav and section-jumping support.
class PortfolioScreen extends StatefulWidget {
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final Color selectedColor;
  final ValueChanged<Color> onColorChanged;

  const PortfolioScreen({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
    required this.selectedColor,
    required this.onColorChanged,
  });

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController _scrollController = ScrollController();

  // GlobalKeys for each section so we can jump to them.
  final List<GlobalKey> _sectionKeys =
      List.generate(PortfolioData.sectionLabels.length, (_) => GlobalKey());

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    final key = _sectionKeys[index];
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
        alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width < 1200;
    final horizontalPadding = isMobile
        ? 20.0
        : isTablet
            ? 60.0
            : 160.0;

    return Scaffold(
      body: Column(
        children: [
          // ── Sticky navigation bar ────────────────────────────
          NavBar(
            sections: PortfolioData.sectionLabels,
            onSectionTap: (i) => () => _scrollToSection(i),
            themeMode: widget.themeMode,
            onThemeModeChanged: widget.onThemeModeChanged,
            selectedColor: widget.selectedColor,
            onColorChanged: widget.onColorChanged,
          ),

          // ── Scrollable content ───────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                
                  children: [
                    // Hero
                    const HeroSection(),
                    const SectionDivider(),

                    // 0 — About
                    SectionHeadline(
                      key: _sectionKeys[0],
                      icon: Icons.person_outline_rounded,
                      title: 'Professional Summary',
                    ),
                    const SizedBox(height: 20),
                    const AboutSection(),
                    const SectionDivider(),

                    // 1 — Skills (Technical + Programming + Spoken)
                    SectionHeadline(
                      key: _sectionKeys[1],
                      icon: Icons.auto_awesome_outlined,
                      title: 'Technical Skills',
                    ),
                    const SizedBox(height: 20),
                    const SkillsSection(),
                    const SizedBox(height: 32),
                    const SectionHeadline(
                      icon: Icons.code_rounded,
                      title: 'Programming Languages',
                    ),
                    const SizedBox(height: 20),
                    const ProgrammingLanguagesSection(),
                    const SectionDivider(),

                    // 2 — Experience
                    SectionHeadline(
                      key: _sectionKeys[2],
                      icon: Icons.work_outline_rounded,
                      title: 'Professional Experience',
                    ),
                    const SizedBox(height: 20),
                    const ExperienceSection(),
                    const SectionDivider(),

                    // 3 — Languages
                    SectionHeadline(
                      key: _sectionKeys[3],
                      icon: Icons.translate_rounded,
                      title: 'Languages',
                    ),
                    const SizedBox(height: 20),
                    const SpokenLanguagesSection(),
                    const SectionDivider(),

                    // 4 — Projects
                    SectionHeadline(
                      key: _sectionKeys[4],
                      icon: Icons.rocket_launch_outlined,
                      title: 'Projects',
                    ),
                    const SizedBox(height: 20),
                    const ProjectsSection(),
                    const SectionDivider(),

                    // 5 — Education
                    SectionHeadline(
                      key: _sectionKeys[5],
                      icon: Icons.school_outlined,
                      title: 'Education',
                    ),
                    const SizedBox(height: 20),
                    const EducationSection(),

                    // Footer
                    const Footer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
