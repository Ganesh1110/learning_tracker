import 'package:flutter/material.dart';

class LayoutBuilderDemo extends StatefulWidget {
  const LayoutBuilderDemo({super.key});

  @override
  State<LayoutBuilderDemo> createState() => _LayoutBuilderDemoState();
}

class _LayoutBuilderDemoState extends State<LayoutBuilderDemo> {
  double _parentWidth = 300.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          elevation: 0,
          color: theme.colorScheme.surfaceContainerLow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: theme.colorScheme.outlineVariant),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LayoutBuilder Settings',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text('Parent Box Width: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${_parentWidth.toStringAsFixed(0)}px'),
                    Expanded(
                      child: Slider(
                        value: _parentWidth,
                        min: 150.0,
                        max: 350.0,
                        onChanged: (val) => setState(() => _parentWidth = val),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output (Adaptive Layout):',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Container(
            width: _parentWidth,
            height: 180,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final isCompact = constraints.maxWidth < 240;

                final items = [
                  _buildTag('Item A', theme.colorScheme.primaryContainer, theme.colorScheme.onPrimaryContainer),
                  _buildTag('Item B', theme.colorScheme.secondaryContainer, theme.colorScheme.onSecondaryContainer),
                  _buildTag('Item C', theme.colorScheme.tertiaryContainer, theme.colorScheme.onTertiaryContainer),
                ];

                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Constraints info header
                      Text(
                        'Constraints: maxW = ${constraints.maxWidth.toStringAsFixed(0)}px',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        isCompact ? 'Compact Mode (Column Layout)' : 'Wide Mode (Row Layout)',
                        style: TextStyle(
                          fontSize: 11,
                          color: theme.colorScheme.onSurfaceVariant,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      
                      // Adaptive Layout Switcher
                      Expanded(
                        child: Center(
                          child: isCompact
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: items.map((item) => Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 2),
                                    child: item,
                                  )).toList(),
                                )
                              : Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  alignment: WrapAlignment.center,
                                  children: items,
                                ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTag(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
      ),
    );
  }
}
