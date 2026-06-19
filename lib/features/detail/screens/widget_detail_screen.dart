import 'package:flutter/material.dart';
import 'package:learning_tracker/core/models/widget_info.dart';
import 'package:learning_tracker/core/registry/widget_registry.dart';
import 'package:learning_tracker/shared/widgets/code_preview.dart';
import 'package:learning_tracker/shared/widgets/rn_comparison_panel.dart';

class WidgetDetailScreen extends StatelessWidget {
  final String widgetName;
  final WidgetInfo? extraInfo;

  const WidgetDetailScreen({
    super.key,
    required this.widgetName,
    this.extraInfo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final info = extraInfo ?? widgetRegistry.firstWhere(
      (w) => w.name == widgetName,
      orElse: () => widgetRegistry.first,
    );
    final categoryColor = info.category.color;

    return Scaffold(
      appBar: AppBar(title: Text(info.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Chip & Description
            Text(
              info.description,
              style: theme.textTheme.bodyLarge?.copyWith(height: 1.4),
            ),
            const SizedBox(height: 12),
            Chip(
              avatar: Icon(
                info.category.icon,
                size: 14,
                color: isDark ? categoryColor : Colors.white,
              ),
              label: Text(
                info.category.displayName,
                style: TextStyle(
                  color: isDark ? categoryColor : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: isDark
                  ? categoryColor.withValues(alpha: 0.15)
                  : categoryColor,
              side: BorderSide(color: categoryColor.withValues(alpha: 0.3)),
            ),
            const SizedBox(height: 32),

            // Live Demo Section
            _buildSectionHeader(
              context,
              'Live Demo',
              Icons.play_circle_outline_rounded,
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: theme.colorScheme.outlineVariant,
                  width: 1,
                ),
              ),
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                color: isDark
                    ? theme.colorScheme.surfaceContainer
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Center(child: info.demoBuilder(context)),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Dart Code Section
            _buildSectionHeader(context, 'Dart Code', Icons.code_rounded),
            const SizedBox(height: 12),
            CodePreview(code: info.dartCode),
            const SizedBox(height: 32),

            // React Native Equivalent Section
            RnComparisonPanel(rnEquivalent: info.rnEquivalent),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    IconData icon,
  ) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, size: 20, color: theme.colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
