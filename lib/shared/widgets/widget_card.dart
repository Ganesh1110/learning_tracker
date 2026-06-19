import 'package:flutter/material.dart';
import 'package:learning_tracker/core/models/widget_info.dart';

class WidgetCard extends StatelessWidget {
  final WidgetInfo info;
  final VoidCallback onTap;

  const WidgetCard({super.key, required this.info, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categoryColor = info.category.color;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Category Icon & Tag
              Row(
                children: [
                  Icon(
                    info.category.icon,
                    size: 16,
                    color: categoryColor,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      info.category.displayName.toUpperCase(),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: categoryColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Title
              Text(
                info.name,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.2,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              // Description Snippet
              Expanded(
                child: Text(
                  info.description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 8),
              // Bottom Indicator Row
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Learn',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 14,
                    color: theme.colorScheme.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
