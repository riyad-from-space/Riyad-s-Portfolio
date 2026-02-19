import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';

/// Education card(s).
class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ts = Theme.of(context).textTheme;
    final accent = Theme.of(context).colorScheme.primary;

    return Column(
      children: PortfolioData.education.map((item) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(Icons.school_outlined,
                      color: accent, size: 28),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['degree']!, style: ts.headlineMedium),
                      const SizedBox(height: 6),
                      Text(item['institute']!, style: ts.bodyLarge),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 16,
                        runSpacing: 8,
                        children: [
                          _InfoBadge(
                            icon: Icons.calendar_today_outlined,
                            text: item['duration']!,
                            accent: accent,
                            ts: ts,
                          ),
                          _InfoBadge(
                            icon: Icons.grade_outlined,
                            text: 'CGPA: ${item['cgpa']}',
                            accent: accent,
                            ts: ts,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _InfoBadge extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color accent;
  final TextTheme ts;

  const _InfoBadge({
    required this.icon,
    required this.text,
    required this.accent,
    required this.ts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: accent.withValues(alpha: 0.7)),
          const SizedBox(width: 6),
          Text(text, style: ts.labelSmall),
        ],
      ),
    );
  }
}
