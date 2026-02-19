import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../models/experience_model.dart';

/// Timeline-style list of experiences.
class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(PortfolioData.experiences.length, (i) {
        return _ExperienceCard(
          experience: PortfolioData.experiences[i],
          isLast: i == PortfolioData.experiences.length - 1,
        );
      }),
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final ExperienceModel experience;
  final bool isLast;

  const _ExperienceCard({required this.experience, required this.isLast});

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final ts = Theme.of(context).textTheme;
    final accent = Theme.of(context).colorScheme.primary;
    final isMobile = MediaQuery.of(context).size.width < 600;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Timeline dot & line ───────────────────
              if (!isMobile) ...[
                SizedBox(
                  width: 32,
                  child: Column(
                    children: [
                      Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _hovered ? accent : accent.withValues(alpha: 0.4),
                          border: Border.all(color: accent, width: 2),
                        ),
                      ),
                      if (!widget.isLast)
                        Expanded(
                          child: Container(
                            width: 2,
                            color: accent.withValues(alpha: 0.15),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
              ],

              // ── Card ──────────────────────────────────
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  transform: _hovered
                      ? (Matrix4.identity()..setTranslationRaw(0, -3, 0))
                      : Matrix4.identity(),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: _hovered
                            ? accent.withValues(alpha: 0.4)
                            : Theme.of(context)
                                .colorScheme
                                .outline
                                .withValues(alpha: 0.2),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title + Company
                          Text(widget.experience.title,
                              style: ts.headlineMedium),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.business_outlined,
                                  size: 16,
                                  color: accent.withValues(alpha: 0.7)),
                              const SizedBox(width: 6),
                              Text(widget.experience.company,
                                  style: ts.bodyMedium?.copyWith(
                                      color: accent,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(width: 16),
                              Icon(Icons.calendar_today_outlined,
                                  size: 14,
                                  color: ts.bodyMedium?.color
                                      ?.withValues(alpha: 0.5)),
                              const SizedBox(width: 4),
                              Text(widget.experience.period,
                                  style: ts.labelSmall),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Bullets
                          ...widget.experience.bullets.map(
                            (b) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Container(
                                      width: 6,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: accent.withValues(alpha: 0.5),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(b, style: ts.bodyLarge),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
