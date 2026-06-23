import 'package:flutter/material.dart';

class IconDemo extends StatefulWidget {
  const IconDemo({super.key});

  @override
  State<IconDemo> createState() => _IconDemoState();
}

class _IconDemoState extends State<IconDemo> {
  double _iconSize = 48.0;
  Color _iconColor = Colors.blue;
  IconData _selectedIcon = Icons.star;

  final Map<String, IconData> _icons = {
    'Star': Icons.star,
    'Settings': Icons.settings,
    'Info': Icons.info,
    'Favorite': Icons.favorite,
    'Email': Icons.email,
  };

  final Map<String, Color> _colors = {
    'Blue': Colors.blue,
    'Amber': Colors.amber,
    'Red': Colors.red,
    'Green': Colors.green,
    'Purple': Colors.purple,
  };

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
                  'Icon Settings',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text('Icon Size: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${_iconSize.toStringAsFixed(0)}px'),
                    Expanded(
                      child: Slider(
                        value: _iconSize,
                        min: 24,
                        max: 96,
                        onChanged: (val) => setState(() => _iconSize = val),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Glyph: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButton<IconData>(
                      value: _selectedIcon,
                      onChanged: (IconData? val) {
                        if (val != null) {
                          setState(() => _selectedIcon = val);
                        }
                      },
                      items: _icons.entries.map((entry) {
                        return DropdownMenuItem<IconData>(
                          value: entry.value,
                          child: Text(entry.key),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Color: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButton<Color>(
                      value: _iconColor,
                      onChanged: (Color? val) {
                        if (val != null) {
                          setState(() => _iconColor = val);
                        }
                      },
                      items: _colors.entries.map((entry) {
                        return DropdownMenuItem<Color>(
                          value: entry.value,
                          child: Text(entry.key),
                        );
                      }).toList(),
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
          height: 180,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Icon(
            _selectedIcon,
            size: _iconSize,
            color: _iconColor,
          ),
        ),
      ],
    );
  }
}
