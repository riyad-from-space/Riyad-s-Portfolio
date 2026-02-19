import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';

/// Hero section with name, role, summary, and contact chips.
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ts = Theme.of(context).textTheme;
    final accent = Theme.of(context).colorScheme.primary;
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 32 : 56),
      child: Column(
        children: [
          // ── Avatar ──────────────────────────────────────────────
          Container(
            width: isMobile ? 100 : 130,
            height: isMobile ? 100 : 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: accent, width: 3),
              boxShadow: [
                BoxShadow(
                  color: accent.withValues(alpha: 0.25),
                  blurRadius: 24,
                  spreadRadius: 2,
                ),
              ],
              image: const DecorationImage(
                image: AssetImage('assets/images/profile.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // ── Name ────────────────────────────────────────────────
          Text(
            PortfolioData.name,
            style: ts.displayLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),

          // ── Role ────────────────────────────────────────────────
          Text(
            PortfolioData.role,
            style: ts.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // ── Contact chips ───────────────────────────────────────
          const Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: [
              _ContactChip(
                icon: Icons.email_outlined,
                label: 'Email',
                url: 'mailto:ahmedriyad10186@gmail.com',
              ),
              _ContactChip(
                icon: Icons.phone_outlined,
                label: '01799771074',
                url: 'tel:01799771074',
              ),
              _ContactChip(
                icon: Icons.link_rounded,
                label: 'LinkedIn',
                url: 'https://www.linkedin.com/in/riyadfromspace/',
              ),
              _ContactChip(
                icon: Icons.code_rounded,
                label: 'GitHub',
                url: 'https://github.com/riyad-from-space',
              ),
              _ContactChip(
                icon: Icons.location_on_outlined,
                label: 'Sylhet, Bangladesh',
                url:
                    'https://www.google.com/maps/search/?api=1&query=Sylhet%2C%20Bangladesh',
              ),
              _ContactChip(
                icon: Icons.description_outlined,
                label: 'Resume',
                url:
                    'https://drive.google.com/drive/folders/1h_VemUqO-U3_lX3Zm-6jmpfww226fLSs?usp=sharing',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContactChip extends StatefulWidget {
  final IconData icon;
  final String label;
  final String url;

  const _ContactChip({
    required this.icon,
    required this.label,
    required this.url,
  });

  @override
  State<_ContactChip> createState() => _ContactChipState();
}

class _ContactChipState extends State<_ContactChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.primary;
    final ts = Theme.of(context).textTheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.platformDefault);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _hovered
                ? accent.withValues(alpha: 0.12)
                : accent.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: _hovered
                  ? accent.withValues(alpha: 0.5)
                  : accent.withValues(alpha: 0.15),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 16, color: accent),
              const SizedBox(width: 6),
              Text(
                widget.label,
                style: ts.labelMedium?.copyWith(
                  color: _hovered ? accent : null,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
