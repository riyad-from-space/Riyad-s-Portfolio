import 'package:flutter/material.dart';
import '../config/app_colors.dart';

/// Top navigation bar with section-jumping chips and theme controls.
class NavBar extends StatelessWidget {
  final List<String> sections;
  final VoidCallback Function(int index) onSectionTap;
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final Color selectedColor;
  final ValueChanged<Color> onColorChanged;

  const NavBar({
    super.key,
    required this.sections,
    required this.onSectionTap,
    required this.themeMode,
    required this.onThemeModeChanged,
    required this.selectedColor,
    required this.onColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accent = Theme.of(context).colorScheme.primary;
    final ts = Theme.of(context).textTheme;
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 24,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.navBarDark.withValues(alpha: 0.95)
            : AppColors.navBarLight.withValues(alpha: 0.95),
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: isMobile ? _buildMobileNav(context, ts, accent, isDark) : _buildDesktopNav(context, ts, accent, isDark),
    );
  }

  Widget _buildDesktopNav(BuildContext context, TextTheme ts, Color accent, bool isDark) {
    return Row(
      children: [
        // Logo / name
        Text(
          'R.',
          style: ts.headlineLarge?.copyWith(
            color: accent,
            fontWeight: FontWeight.w800,
            fontSize: 28,
          ),
        ),
        const SizedBox(width: 32),

        // Section links
        Expanded(
          child: Row(
            children: List.generate(sections.length, (i) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: _NavChip(
                  label: sections[i],
                  onTap: onSectionTap(i),
                  textStyle: ts.labelMedium!,
                  accent: accent,
                ),
              );
            }),
          ),
        ),

        // Controls
        _buildControls(context, accent, isDark),
      ],
    );
  }

  Widget _buildMobileNav(BuildContext context, TextTheme ts, Color accent, bool isDark) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'R.',
              style: ts.headlineLarge?.copyWith(
                color: accent,
                fontWeight: FontWeight.w800,
                fontSize: 24,
              ),
            ),
            _buildControls(context, accent, isDark),
          ],
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(sections.length, (i) {
              return Padding(
                padding: const EdgeInsets.only(right: 6),
                child: _NavChip(
                  label: sections[i],
                  onTap: onSectionTap(i),
                  textStyle: ts.labelMedium!.copyWith(fontSize: 11),
                  accent: accent,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildControls(BuildContext context, Color accent, bool isDark) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Color picker
        PopupMenuButton<Color>(
          tooltip: 'Accent color',
          offset: const Offset(0, 44),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          icon: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: accent.withValues(alpha: 0.4),
              ),
            ),
            child: Icon(Icons.palette_outlined, size: 18, color: accent),
          ),
          itemBuilder: (_) => AppColors.accentOptions.map((opt) {
            final isSelected = opt.color.toARGB32() == selectedColor.toARGB32();
            return PopupMenuItem<Color>(
              value: opt.color,
              child: Row(
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: opt.color,
                      shape: BoxShape.circle,
                      border: isSelected
                          ? Border.all(color: Colors.white, width: 2)
                          : null,
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: opt.color.withValues(alpha: 0.5),
                                blurRadius: 6,
                              ),
                            ]
                          : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(opt.name),
                  if (isSelected) ...[
                    const Spacer(),
                    Icon(Icons.check, size: 18, color: opt.color),
                  ],
                ],
              ),
            );
          }).toList(),
          onSelected: onColorChanged,
        ),

        const SizedBox(width: 4),

        // Theme toggle
        IconButton(
          tooltip: isDark ? 'Light mode' : 'Dark mode',
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Icon(
              isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
              key: ValueKey(isDark),
              size: 20,
              color: accent,
            ),
          ),
          onPressed: () {
            onThemeModeChanged(isDark ? ThemeMode.light : ThemeMode.dark);
          },
        ),
      ],
    );
  }
}

class _NavChip extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final TextStyle textStyle;
  final Color accent;

  const _NavChip({
    required this.label,
    required this.onTap,
    required this.textStyle,
    required this.accent,
  });

  @override
  State<_NavChip> createState() => _NavChipState();
}

class _NavChipState extends State<_NavChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: _hovered
                ? widget.accent.withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            widget.label,
            style: widget.textStyle.copyWith(
              color: _hovered ? widget.accent : null,
            ),
          ),
        ),
      ),
    );
  }
}
