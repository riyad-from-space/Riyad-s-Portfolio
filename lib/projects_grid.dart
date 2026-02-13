import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_container.dart';

class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String? playStoreLink;
  final String? appStoreLink;
  final String? githubLink;

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    this.playStoreLink,
    this.appStoreLink,
    this.githubLink,
  });
}

class ProjectsGrid extends StatelessWidget {
  final String fontFamily;
  const ProjectsGrid({super.key, required this.fontFamily});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final primary = Theme.of(context).colorScheme.primary;
    final isMobile = 1.sw < 600;
    final isTablet = 1.sw >= 600 && 1.sw < 1200;

    const projects = [
      Project(
        title: 'EzyCourse - SaaS Platform',
        description:
            'Enterprise SaaS platform powering 1,000+ course creators and their communities with real-time collaboration and content delivery',
        technologies: ['Flutter', 'Bloc', 'REST API', 'Firebase', 'CI/CD'],
        playStoreLink:
            'https://play.google.com/store/apps/details?id=com.ezycourse.ezycourse&hl=en',
        appStoreLink: 'https://apps.apple.com/fi/app/ezycourse/id6443599486',
      ),
      Project(
        title: 'NewsSip - News in 60 Words',
        description:
            'Concise news aggregation app delivering bite-sized news updates with real-time synchronization and personalized content',
        technologies: ['Flutter', 'BLoC', 'Firebase', 'WebSockets'],
        playStoreLink:
            'https://play.google.com/store/apps/details?id=com.heapiphy.newssip&hl=en',
        githubLink: 'https://github.com/Heapiphy/bulletins.git',
      ),
      Project(
        title: 'Community Platform',
        description: 'Production-ready social learning platform enabling course creators to build and manage engaged student communities',
        technologies: ['Flutter', 'Rest API', 'Riverpod', 'Clean Architecture'],
        githubLink:
            'https://github.com/riyad-from-space/Ezycourse-Community.git',
      ),
      Project(
        title: 'Sheba AI - Medical Assistant',
        description: 'AI-powered healthcare app providing instant medical consultation and diagnosis assistance',
        technologies: [
          'Flutter',
          'Rest API',
          'Riverpod',
          'Clean Architecture',
          'AI Integration'
        ],
        githubLink: 'https://github.com/Noctambulist007/Sheba_AI.git',
      ),
      Project(
        title: 'Fish Disease Detection',
        description: 'ML-based mobile app for real-time fish disease identification using computer vision and FastAPI',
        technologies: ['Flutter', 'AI Model', 'FastAPI', 'Python'],
        githubLink:
            'https://github.com/riyad-from-space/Fish-Disease-Detection-App.git',
      ),
      Project(
        title: 'Connect - Social Blogging Platform',
        description: 'Feature-rich blogging app with real-time updates, user profiles, and content discovery',
        technologies: ['Flutter', 'Firebase', 'Riverpod', 'MVVM'],
        githubLink: 'https://github.com/riyad-from-space/Connect.git',
      ),
      Project(
        title: 'LU Insights - Campus Companion',
        description: 'University student hub for academic resources, notices, and campus event management',
        technologies: ['Flutter', 'Firebase', 'Riverpod', 'MVVM'],
        githubLink: 'https://github.com/riyad-from-space/LU-Insights.git',
      ),
      Project(
        title: 'Interactive Portfolio Website',
        description: 'Responsive web portfolio built entirely with Flutter, showcasing dynamic theming and smooth UX',
        technologies: [
          'Flutter Web',
          'Firebase Hosting',
          'Responsive Design',
        ],
        githubLink: 'https://github.com/riyad-from-space/Riyad-s-Portfolio.git',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile
            ? 1
            : isTablet
                ? 2
                : 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        mainAxisExtent: isMobile
            ? 220.h
            : isTablet
                ? 240.h
                : 260.h,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return _ProjectCard(
          project: projects[index],
          isMobile: isMobile,
          isTablet: isTablet,
          theme: theme,
          primary: primary,
        );
      },
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;
  final bool isMobile;
  final bool isTablet;
  final TextTheme theme;
  final Color primary;

  const _ProjectCard({
    required this.project,
    required this.isMobile,
    required this.isTablet,
    required this.theme,
    required this.primary,
  });

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Title
            Text(
              project.title,
              style: theme.headlineMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8.h),

            // Project Description
            Text(
              project.description,
              style: theme.displaySmall?.copyWith(
                fontSize: isMobile ? 12 : 13,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10.h),

            // Technologies Used
            Expanded(
              child: Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: project.technologies.map((tech) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: primary.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      tech,
                      style: theme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            SizedBox(height: 12.h),

            // Action Buttons
            Row(
              children: [
                if (project.playStoreLink != null) ...[
                  Expanded(
                    child: _LinkButton(
                      label: 'Play Store',
                      icon: Icons.shop,
                      onTap: () => _launchUrl(project.playStoreLink!),
                      theme: theme,
                      primary: primary,
                    ),
                  ),
                  SizedBox(width: 10.w),
                ],
                if (project.appStoreLink != null) ...[
                  Expanded(
                    child: _LinkButton(
                      label: 'App Store',
                      icon: Icons.apple,
                      onTap: () => _launchUrl(project.appStoreLink!),
                      theme: theme,
                      primary: primary,
                    ),
                  ),
                  SizedBox(width: 10.w),
                ],
                if (project.githubLink != null)
                  Expanded(
                    child: _LinkButton(
                      label: 'GitHub',
                      icon: Icons.code,
                      onTap: () => _launchUrl(project.githubLink!),
                      theme: theme,
                      primary: primary,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LinkButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final TextTheme theme;
  final Color primary;

  const _LinkButton({
    required this.label,
    required this.icon,
    required this.onTap,
    required this.theme,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) { 
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 12.w,
        ),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
       
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: primary, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: primary,
            ),
            SizedBox(width: 8.w),
            Flexible(
              child: Text(
                label,
                style: theme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
