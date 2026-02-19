import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';
import '../models/project_model.dart';

/// Interactive project cards grid with optional cover images and screenshot galleries.
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width < 1200;
    final crossAxisCount = isMobile
        ? 1
        : isTablet
            ? 2
            : 2;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        mainAxisExtent: isMobile ? 420 : 440,
      ),
      itemCount: PortfolioData.projects.length,
      itemBuilder: (context, index) {
        return _ProjectCard(project: PortfolioData.projects[index]);
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────
// Project Card
// ─────────────────────────────────────────────────────────────────

class _ProjectCard extends StatefulWidget {
  final ProjectModel project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final ts = Theme.of(context).textTheme;
    final accent = Theme.of(context).colorScheme.primary;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final project = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: _hovered
            ? (Matrix4.identity()..setTranslationRaw(0, -6, 0))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: isDark
              ? const Color(0xFF16213E)
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered
                ? accent.withValues(alpha: 0.5)
                : Theme.of(context).colorScheme.outline.withValues(alpha: 0.15),
            width: _hovered ? 1.5 : 1,
          ),
          boxShadow: [
            if (_hovered)
              BoxShadow(
                color: accent.withValues(alpha: 0.12),
                blurRadius: 24,
                offset: const Offset(0, 8),
              )
            else
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Cover Image / Placeholder ─────────────────────
            _CoverArea(
              project: project,
              accent: accent,
              isDark: isDark,
              hovered: _hovered,
            ),

            // ── Content ───────────────────────────────────────
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      project.title,
                      style: ts.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    // Description
                    Text(
                      project.description,
                      style: ts.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 14),

                    // Technology chips
                    Expanded(
                      child: Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: project.technologies.map((tech) {
                          return Chip(
                            label: Text(tech),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                          );
                        }).toList(),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // ── Action buttons ─────────────────────────
                    Row(
                      children: [
                        if (project.playStoreLink != null)
                          _ActionButton(
                            icon: Icons.shop_outlined,
                            label: 'Play Store',
                            url: project.playStoreLink!,
                            accent: accent,
                          ),
                        if (project.appStoreLink != null)
                          _ActionButton(
                            icon: Icons.apple_outlined,
                            label: 'App Store',
                            url: project.appStoreLink!,
                            accent: accent,
                          ),
                        if (project.githubLink != null)
                          _ActionButton(
                            icon: Icons.code_rounded,
                            label: 'GitHub',
                            url: project.githubLink!,
                            accent: accent,
                          ),
                        if (project.webLink != null)
                          _ActionButton(
                            icon: Icons.language_rounded,
                            label: 'Web',
                            url: project.webLink!,
                            accent: accent,
                          ),
                        const Spacer(),
                        // Screenshots button (only if available)
                        if (project.screenshots.isNotEmpty)
                          _ScreenshotButton(
                            project: project,
                            accent: accent,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────
// Cover Area — shows image or gradient placeholder
// ─────────────────────────────────────────────────────────────────

class _CoverArea extends StatelessWidget {
  final ProjectModel project;
  final Color accent;
  final bool isDark;
  final bool hovered;

  const _CoverArea({
    required this.project,
    required this.accent,
    required this.isDark,
    required this.hovered,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: SizedBox(
        height: 180,
        width: double.infinity,
        child: project.coverImage != null
            ? Image.asset(
                project.coverImage!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _placeholder(),
              )
            : _placeholder(),
      ),
    );
  }

  Widget _placeholder() {
    // Unique gradient per project using title hashCode
    final hash = project.title.hashCode;
    final hue1 = (hash % 360).abs().toDouble();
    final hue2 = ((hash ~/ 7) % 360).abs().toDouble();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            HSLColor.fromAHSL(1, hue1, 0.5, isDark ? 0.2 : 0.9).toColor(),
            HSLColor.fromAHSL(1, hue2, 0.5, isDark ? 0.15 : 0.85).toColor(),
          ],
        ),
      ),
      child: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: hovered ? 1.0 : 0.5,
          child: Icon(
            Icons.image_outlined,
            size: 48,
            color: accent.withValues(alpha: 0.4),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────
// Action Button (Play Store, GitHub, etc.)
// ─────────────────────────────────────────────────────────────────

class _ActionButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final String url;
  final Color accent;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.url,
    required this.accent,
  });

  @override
  State<_ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton> {
  bool _hovered = false;

  Future<void> _launch() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: _launch,
          child: Tooltip(
            message: widget.label,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _hovered
                    ? widget.accent.withValues(alpha: 0.12)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: _hovered
                      ? widget.accent.withValues(alpha: 0.5)
                      : widget.accent.withValues(alpha: 0.2),
                ),
              ),
              child: Icon(widget.icon, size: 18, color: widget.accent),
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────
// Screenshot Gallery Button + Overlay
// ─────────────────────────────────────────────────────────────────

class _ScreenshotButton extends StatelessWidget {
  final ProjectModel project;
  final Color accent;

  const _ScreenshotButton({required this.project, required this.accent});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'View screenshots',
      child: InkWell(
        onTap: () => _showGallery(context),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: accent.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: accent.withValues(alpha: 0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.photo_library_outlined, size: 16, color: accent),
              const SizedBox(width: 6),
              Text(
                '${project.screenshots.length}',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: accent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showGallery(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (_) => _ScreenshotGallery(
        project: project,
        accent: accent,
      ),
    );
  }
}

/// Full-screen screenshot gallery overlay.
class _ScreenshotGallery extends StatefulWidget {
  final ProjectModel project;
  final Color accent;

  const _ScreenshotGallery({required this.project, required this.accent});

  @override
  State<_ScreenshotGallery> createState() => _ScreenshotGalleryState();
}

class _ScreenshotGalleryState extends State<_ScreenshotGallery> {
  late final PageController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenshots = widget.project.screenshots;
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(isMobile ? 16 : 40),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900, maxHeight: 650),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            // ── Header ──────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.project.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${_currentIndex + 1} / ${screenshots.length}',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded),
                  ),
                ],
              ),
            ),

            // ── Gallery ─────────────────────────────────
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView.builder(
                    controller: _controller,
                    itemCount: screenshots.length,
                    onPageChanged: (i) =>
                        setState(() => _currentIndex = i),
                    itemBuilder: (_, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            screenshots[i],
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) => Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 48,
                                    color: widget.accent.withValues(alpha: 0.3),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Add screenshot at:\n${screenshots[i]}',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.labelSmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  // Arrow nav
                  if (screenshots.length > 1) ...[
                    Positioned(
                      left: 4,
                      child: IconButton(
                        onPressed: _currentIndex > 0
                            ? () => _controller.previousPage(
                                  duration:
                                      const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                )
                            : null,
                        icon: Icon(
                          Icons.chevron_left_rounded,
                          size: 32,
                          color: widget.accent,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 4,
                      child: IconButton(
                        onPressed:
                            _currentIndex < screenshots.length - 1
                                ? () => _controller.nextPage(
                                      duration: const Duration(
                                          milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    )
                                : null,
                        icon: Icon(
                          Icons.chevron_right_rounded,
                          size: 32,
                          color: widget.accent,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // ── Dot indicators ──────────────────────────
            if (screenshots.length > 1)
              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(screenshots.length, (i) {
                    final isActive = i == _currentIndex;
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(
                        i,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: isActive ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: isActive
                              ? widget.accent
                              : widget.accent.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    );
                  }),
                ),
              ),

            // ── Thumbnail strip ─────────────────────────
            SizedBox(
              height: 72,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: screenshots.length,
                itemBuilder: (_, i) {
                  final isActive = i == _currentIndex;
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(
                      i,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 60,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isActive
                              ? widget.accent
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          screenshots[i],
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            color: widget.accent.withValues(alpha: 0.1),
                            child: Icon(
                              Icons.image_outlined,
                              size: 20,
                              color: widget.accent.withValues(alpha: 0.4),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
