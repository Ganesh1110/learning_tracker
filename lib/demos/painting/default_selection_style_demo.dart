import 'package:flutter/material.dart';

class DefaultSelectionStyleDemo extends StatefulWidget {
  const DefaultSelectionStyleDemo({super.key});

  @override
  State<DefaultSelectionStyleDemo> createState() => _DefaultSelectionStyleDemoState();
}

class _DefaultSelectionStyleDemoState extends State<DefaultSelectionStyleDemo> {
  Color _selectedColor = Colors.teal;
  Color _cursorColor = Colors.red;

  final List<Color> _selectionColors = [
    Colors.teal,
    Colors.amber,
    Colors.pink,
    Colors.blue,
  ];

  final List<Color> _cursorColors = [
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.indigo,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'Text Selection Style Settings',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 24,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Selection Color Palette
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Selection Highlight: '),
                const SizedBox(width: 8),
                Wrap(
                  spacing: 8,
                  children: _selectionColors.map((c) {
                    final isSelected = _selectedColor == c;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedColor = c),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: c.withValues(alpha: 0.5),
                          shape: BoxShape.circle,
                          border: isSelected
                              ? Border.all(color: theme.colorScheme.onSurface, width: 2)
                              : Border.all(color: Colors.transparent),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),

            // Cursor Color Palette
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Cursor Color: '),
                const SizedBox(width: 8),
                Wrap(
                  spacing: 8,
                  children: _cursorColors.map((c) {
                    final isSelected = _cursorColor == c;
                    return GestureDetector(
                      onTap: () => setState(() => _cursorColor = c),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: c,
                          shape: BoxShape.circle,
                          border: isSelected
                              ? Border.all(color: theme.colorScheme.onSurface, width: 2)
                              : Border.all(color: Colors.transparent),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
        const Divider(height: 24),

        // Visual Playground Canvas
        Text(
          'Selection Scopes Comparison',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        // 1. Outside Scope Container
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Outside DefaultSelectionStyle (Standard Theme Selection)',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const SelectableText(
                'Drag or double-tap this text to see standard default selection behavior.',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // 2. Inside Scope Container
        DefaultSelectionStyle(
          selectionColor: _selectedColor.withValues(alpha: 0.4),
          cursorColor: _cursorColor,
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: _selectedColor.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _selectedColor.withValues(alpha: 0.3), width: 1.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Inside DefaultSelectionStyle (Custom Selection Applied)',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: _selectedColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const SelectableText(
                  'Select this text block to see the custom color highlight we defined above!',
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 12),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Focus this textfield to see the custom cursor color',
                    labelStyle: TextStyle(fontSize: 11, color: theme.colorScheme.onSurfaceVariant),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    border: const OutlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
