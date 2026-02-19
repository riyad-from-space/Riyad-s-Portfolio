import 'package:flutter/material.dart';

/// Styled section headline with icon and underline accent.
class SectionHeadline extends StatelessWidget {
  final IconData icon;
  final String title;

  const SectionHeadline({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.primary;
    final ts = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: accent, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: ts.headlineLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          width: 60,
          height: 3,
          decoration: BoxDecoration(
            color: accent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
