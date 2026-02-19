import 'package:flutter/material.dart';

/// Simple footer bar.
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.primary;
    final ts = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 32),
      child: Column(
        children: [
          Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  accent.withValues(alpha: 0.2),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Built with Flutter & ❤️',
            style: ts.labelSmall?.copyWith(
              color: accent.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 4),
          // Text(
          //   '© ${DateTime.now().year} Riyad Ahmed Sagor',
          //   style: ts.labelSmall,
          // ),
        ],
      ),
    );
  }
}
