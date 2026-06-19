import 'package:flutter/material.dart';

class RnComparisonPanel extends StatelessWidget {
  final String rnEquivalent;

  const RnComparisonPanel({super.key, required this.rnEquivalent});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // React branded color palette (React Cyan)
    const reactColor = Color(0xFF00D8FF);
    final containerBg = isDark
        ? Colors.cyan.withValues(alpha: 0.08)
        : Colors.cyan.withValues(alpha: 0.05);
    final borderColor = isDark
        ? Colors.cyan.withValues(alpha: 0.2)
        : Colors.cyan.withValues(alpha: 0.15);
    final textColor = isDark
        ? Colors.cyan[100]
        : Colors.cyan[900];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: containerBg,
        border: Border.all(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: isDark ? Colors.cyan.withValues(alpha: 0.15) : Colors.cyan.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.compare_arrows_rounded,
                  size: 20,
                  color: isDark ? reactColor : Colors.cyan[700],
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'React Native Equivalent',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  Text(
                    'For cross-platform mapping',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: textColor?.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          SelectableText(
            rnEquivalent,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 13,
              height: 1.5,
              color: isDark ? Colors.grey[300] : Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}
