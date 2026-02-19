import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';

/// Grid of technical skill cards.
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ts = Theme.of(context).textTheme;
    final accent = Theme.of(context).colorScheme.primary;
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width < 1200;

    final crossAxisCount = isMobile
        ? 1
        : isTablet
            ? 2
            : 3;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: isMobile ? 3.2 : 2.6,
      ),
      itemCount: PortfolioData.technicalSkills.length,
      itemBuilder: (context, index) {
        final skill = PortfolioData.technicalSkills[index];
        return _SkillCard(
          title: skill['title']!,
          detail: skill['detail']!,
          accent: accent,
          ts: ts,
        );
      },
    );
  }
}

class _SkillCard extends StatefulWidget {
  final String title;
  final String detail;
  final Color accent;
  final TextTheme ts;

  const _SkillCard({
    required this.title,
    required this.detail,
    required this.accent,
    required this.ts,
  });

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: _hovered
            ? (Matrix4.identity()..setTranslationRaw(0, -4, 0))
            : Matrix4.identity(),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: _hovered
                  ? widget.accent.withValues(alpha: 0.4)
                  : Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 4,
                      height: 24,
                      decoration: BoxDecoration(
                        color: widget.accent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        widget.title,
                        style: widget.ts.headlineMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Text(
                    widget.detail,
                    style: widget.ts.bodyMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Programming languages row.
class ProgrammingLanguagesSection extends StatelessWidget {
  const ProgrammingLanguagesSection({super.key});

  static const List<Color> _langColors = [
    Color(0xFF00B8D4), // Dart
    Color(0xFF4CAF50), // Python
    Color(0xFFFF8F00), // Java
    Color(0xFF00897B), // SQL
    Color(0xFF7C4DFF), // C++
  ];

  @override
  Widget build(BuildContext context) {
    final ts = Theme.of(context).textTheme;
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Wrap(
      spacing: 14,
      runSpacing: 14,
      children: List.generate(PortfolioData.programmingLanguages.length, (i) {
        final lang = PortfolioData.programmingLanguages[i];
        final color = _langColors[i % _langColors.length];
        return _LangChip(
          name: lang['name']!,
          level: lang['level']!,
          color: color,
          ts: ts,
          isMobile: isMobile,
        );
      }),
    );
  }
}

class _LangChip extends StatefulWidget {
  final String name;
  final String level;
  final Color color;
  final TextTheme ts;
  final bool isMobile;

  const _LangChip({
    required this.name,
    required this.level,
    required this.color,
    required this.ts,
    required this.isMobile,
  });

  @override
  State<_LangChip> createState() => _LangChipState();
}

class _LangChipState extends State<_LangChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: widget.isMobile ? 16 : 24,
          vertical: widget.isMobile ? 12 : 16,
        ),
        decoration: BoxDecoration(
          color: _hovered
              ? widget.color.withValues(alpha: 0.15)
              : widget.color.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _hovered
                ? widget.color.withValues(alpha: 0.5)
                : widget.color.withValues(alpha: 0.2),
          ),
        ),
        child: Column(
          children: [
            Text(
              widget.name,
              style: widget.ts.headlineMedium?.copyWith(
                color: widget.color,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.level,
              style: widget.ts.labelSmall?.copyWith(
                color: widget.color.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Spoken languages chips.
class SpokenLanguagesSection extends StatelessWidget {
  const SpokenLanguagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.primary;
    final ts = Theme.of(context).textTheme;

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: PortfolioData.spokenLanguages.map((lang) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            color: accent.withValues(alpha: 0.07),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: accent.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.translate_rounded, size: 18, color: accent),
              const SizedBox(width: 8),
              Text(lang, style: ts.headlineMedium),
            ],
          ),
        );
      }).toList(),
    );
  }
}
