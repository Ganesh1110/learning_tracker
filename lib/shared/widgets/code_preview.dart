import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodePreview extends StatelessWidget {
  final String code;

  const CodePreview({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16, 20, 52, 20),
          decoration: BoxDecoration(
            color: isDark ? theme.colorScheme.surfaceContainer : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            border: Border.all(
              color: theme.colorScheme.outlineVariant,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: SelectableText(
            code,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 13,
              height: 1.5,
              color: isDark ? Colors.grey[300] : Colors.grey[800],
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Material(
            color: Colors.transparent,
            child: IconButton(
              icon: Icon(
                Icons.copy_all_rounded,
                size: 20,
                color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
              ),
              tooltip: 'Copy Code',
              onPressed: () {
                Clipboard.setData(ClipboardData(text: code));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Row(
                      children: [
                        Icon(Icons.check_circle_outline, color: Colors.greenAccent),
                        SizedBox(width: 8),
                        Text('Code copied to clipboard!'),
                      ],
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: theme.colorScheme.inverseSurface,
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
