import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';

/// Professional summary card.
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ts = Theme.of(context).textTheme;
    final accent = Theme.of(context).colorScheme.primary;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.format_quote_rounded,
                    color: accent.withValues(alpha: 0.3), size: 32),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              PortfolioData.summary,
              style: ts.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
