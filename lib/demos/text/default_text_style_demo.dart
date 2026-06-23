import 'package:flutter/material.dart';

class DefaultTextStyleDemo extends StatefulWidget {
  const DefaultTextStyleDemo({super.key});

  @override
  State<DefaultTextStyleDemo> createState() => _DefaultTextStyleDemoState();
}

class _DefaultTextStyleDemoState extends State<DefaultTextStyleDemo> {
  double _fontSize = 18.0;
  Color _selectedColor = Colors.blue;
  FontWeight _fontWeight = FontWeight.normal;
  bool _inherit = true;

  final List<Color> _colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final currentStyle = TextStyle(
      fontSize: _fontSize,
      color: _selectedColor,
      fontWeight: _fontWeight,
    );

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
                  'DefaultTextStyle Configuration',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                // Font Size Slider
                Row(
                  children: [
                    const Text('Font Size: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${_fontSize.toStringAsFixed(0)}px'),
                    Expanded(
                      child: Slider(
                        value: _fontSize,
                        min: 12,
                        max: 36,
                        onChanged: (val) => setState(() => _fontSize = val),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Color Selectors
                Row(
                  children: [
                    const Text('Text Color: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: _colors.map((color) {
                            final isSelected = _selectedColor == color;
                            return GestureDetector(
                              onTap: () => setState(() => _selectedColor = color),
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? theme.colorScheme.onSurface
                                        : Colors.transparent,
                                    width: 2.5,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Font Weight Switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Bold Text', style: TextStyle(fontWeight: FontWeight.bold)),
                    Switch(
                      value: _fontWeight == FontWeight.bold,
                      onChanged: (val) {
                        setState(() {
                          _fontWeight = val ? FontWeight.bold : FontWeight.normal;
                        });
                      },
                    ),
                  ],
                ),
                // Inherit Switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Child overrides styles', style: TextStyle(fontWeight: FontWeight.bold)),
                    Switch(
                      value: !_inherit,
                      onChanged: (val) {
                        setState(() {
                          _inherit = !val;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Visual Output:',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: DefaultTextStyle(
            style: currentStyle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('1. Inheriting styling from DefaultTextStyle.'),
                const SizedBox(height: 8),
                const Text('2. Also inheriting automatically without style definition.'),
                const SizedBox(height: 8),
                Text(
                  '3. Child Text with local style override.',
                  style: _inherit
                      ? null
                      : const TextStyle(
                          fontSize: 14.0,
                          color: Colors.red,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
