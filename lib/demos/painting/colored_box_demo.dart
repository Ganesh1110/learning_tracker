import 'package:flutter/material.dart';

class ColoredBoxDemo extends StatefulWidget {
  const ColoredBoxDemo({super.key});

  @override
  State<ColoredBoxDemo> createState() => _ColoredBoxDemoState();
}

class _ColoredBoxDemoState extends State<ColoredBoxDemo> {
  Color _selectedColor = Colors.blue;
  bool _useColoredBox = true;

  final Map<String, Color> _colors = {
    'Blue (Primary)': Colors.blue,
    'Emerald Green': Colors.green,
    'Amber Orange': Colors.amber,
    'Ruby Red': Colors.red,
    'Deep Purple': Colors.purple,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Controls Section
        Text(
          'ColoredBox Configurations',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Color Selector
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Background Color: '),
                DropdownButton<Color>(
                  value: _selectedColor,
                  onChanged: (color) {
                    if (color != null) {
                      setState(() => _selectedColor = color);
                    }
                  },
                  items: _colors.entries.map((e) {
                    return DropdownMenuItem(
                      value: e.value,
                      child: Text(e.key),
                    );
                  }).toList(),
                ),
              ],
            ),

            // Mode Selector: ColoredBox vs Container (with decoration)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Implementation: '),
                ChoiceChip(
                  label: const Text('ColoredBox (Lightweight)'),
                  selected: _useColoredBox,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => _useColoredBox = true);
                    }
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Container (Decorated)'),
                  selected: !_useColoredBox,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => _useColoredBox = false);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
        const Divider(height: 24),

        // Visual Playground Canvas
        Text(
          'Playground Canvas',
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          _useColoredBox
              ? 'ColoredBox directly paints a solid color on the canvas in the render tree without building any decoration objects.'
              : 'Container builds a complex BoxDecoration, useful for rounded corners, borders, or shadows, but is heavier.',
          style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 12),
        Container(
          height: 260,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          alignment: Alignment.center,
          child: _useColoredBox
              ? SizedBox(
                  width: 220,
                  height: 160,
                  child: ColoredBox(
                    color: _selectedColor,
                    child: _buildInnerContent(),
                  ),
                )
              : Container(
                  width: 220,
                  height: 160,
                  decoration: BoxDecoration(
                    color: _selectedColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: _buildInnerContent(),
                ),
        ),
      ],
    );
  }

  Widget _buildInnerContent() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.palette_outlined, color: Colors.white, size: 36),
          SizedBox(height: 8),
          Text(
            'Color Block',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
